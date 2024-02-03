import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/screen_config.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/categories/category_section_home.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/home_title.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/items/item_grid_card_home.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/items/new_item_list_card.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/items/sale_item_list_card_home.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/offer/offers_widget.dart';
import 'package:mini_ecommerce/injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double screenHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider<HomeCubit>(
      create: (context) => sl<HomeCubit>()..getData(context, widget.userId),
      child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () {
            return BlocProvider.of<HomeCubit>(context)
                .getData(context, widget.userId);
          },
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.5),
                // image: const DecorationImage(
                //   opacity: 0.5,
                //   fit: BoxFit.contain,
                //   image: AssetImage("assets/images/logoBack.png"),
                // ),
              ),
              child: Padding(
                ///for screen Border
                padding: EdgeInsets.all(screenWidth * 0.001),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraint.maxWidth * 0.01,
                          vertical: constraint.maxHeight * 0.015),
                      child: ListView(
                        children: [
                          ///offers
                          OffersWidget(
                            height: constraint.maxHeight * 0.3,
                            width: constraint.maxWidth,
                          ),
                          SizedBox(
                            height: constraint.maxHeight * 0.02,
                          ),

                          ///categories
                          CategorySectionHome(
                            height: constraint.maxHeight * 0.1,
                            width: constraint.maxWidth,
                          ),
                          SaleItemListCard(
                            height: constraint.maxHeight * 0.45,
                            width: constraint.maxWidth,
                          ),
                          // SectionTitle(title: "new".tr(context)),
                          NewItemListCard(
                            height: constraint.maxHeight * 0.45,
                            width: constraint.maxWidth,
                          ),
                          SizedBox(
                            height: constraint.maxHeight * 0.07,
                          ),
                          SectionTitle(title: "recommended".tr(context)),

                          ItemGridCard(
                            height: constraint.maxHeight,
                            width: constraint.maxWidth,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
//previous
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key, required this.userId}) : super(key: key);
//   final String userId;
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//
//     double screenHeight =
//         MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return BlocProvider<HomeCubit>(
//       create: (context) => sl<HomeCubit>()..getData(context, widget.userId),
//       child: Scaffold(
//         // floatingActionButton: CustomFloatingActionButton(
//         //     width: screenWidth,
//         //     onPressed: () {
//         //       // print("object");
//         //       Navigator.pushNamed(context, AppRoutesName.cartScreen);
//         //       // Navigator.push(context,|
//         //       // MaterialPageRoute(builder: (context) => const CartScreen()));
//         //     }),
//         // appBar: AppBar(
//         //   actions: [
//         //     IconButton(
//         //       onPressed: () {},
//         //       icon: const Icon(Icons.notifications),
//         //     ),
//         //     IconButton(
//         //       onPressed: () {},
//         //       icon: const Icon(Icons.search),
//         //     ),
//         //   ],
//         // ),
//         // bottomNavigationBar: const CustomBottomNavigationBar(),
//         // drawer: CustomDrawer(
//         //   screenHeight: screenHeight,
//         //   screenWidth: screenWidth,
//         // ),
//         body: Builder(builder: (context) {
//           return RefreshIndicator(
//             onRefresh: () {
//               return BlocProvider.of<HomeCubit>(context)
//                   .getData(context, widget.userId);
//             },
//             child: SizedBox(
//               height: screenHeight,
//               width: screenWidth,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: AppColors.grey,
//                   // image: const DecorationImage(
//                   //   opacity: 0.5,
//                   //   fit: BoxFit.contain,
//                   //   image: AssetImage("assets/images/logoBack.png"),
//                   // ),
//                 ),
//                 child: Padding(
//                   ///for screen Border
//                   padding: EdgeInsets.all(screenWidth * 0.02),
//                   child: DecoratedBox(
//                     decoration: boxDecorationBorderStyle,
//                     child: LayoutBuilder(
//                       builder: (context, constraint) {
//                         return Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: constraint.maxWidth * 0.03,
//                               vertical: constraint.maxHeight * 0.015),
//                           child: ListView(
//                             children: [
//                               ///offers
//                               OffersWidget(
//                                 height: constraint.maxHeight * 0.3,
//                                 width: constraint.maxWidth,
//                               ),
//                               SizedBox(
//                                 height: constraint.maxHeight * 0.015,
//                               ),
//                               SectionTitle(title: "categories".tr(context)),
//
//                               ///categories
//                               CategorySectionHome(
//                                 height: constraint.maxHeight * 0.2,
//                                 width: constraint.maxWidth,
//                               ),
//                               SaleItemListCard(
//                                 height: constraint.maxHeight * 0.45,
//                                 width: constraint.maxWidth,
//                               ),
//                               // SectionTitle(title: "new".tr(context)),
//                               NewItemListCard(
//                                 height: constraint.maxHeight * 0.45,
//                                 width: constraint.maxWidth,
//                               ),
//                               SizedBox(
//                                 height: constraint.maxHeight * 0.07,
//                               ),
//                               SectionTitle(title: "recommended".tr(context)),
//
//                               ItemGridCard(
//                                 height: constraint.maxHeight,
//                                 width: constraint.maxWidth,
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
