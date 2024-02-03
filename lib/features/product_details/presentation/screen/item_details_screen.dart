import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_floating_action_button.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/payment/presentation/screen/payment_screen.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/item_detail_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/item_variation/item_variation_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/operations/item_details_operation_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/custom_image_preview.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/custom_item_details_button.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/custom_items_color.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/icons_row_widgets.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/rate_widgets/rate_widget.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/reviews.dart';
import 'package:mini_ecommerce/injection_container.dart';

///todo with NavigatorObserver was this
///
class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({
    Key? key,
    required this.itemId,
    // this.itemsEntity,
  }) : super(key: key);
  final int itemId;
  // final itemsEntity;

  @override
  Widget build(BuildContext context) {
    // print("when navigate--> $itemsEntity");
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;
    final Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ItemDetailsOperationCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              sl<ItemVariationCubit>()..getVariationData(itemId, context),
        ),
        BlocProvider(
            create: (context) =>
                sl<ItemDetailCubit>()..getData(itemId, context)),
      ],
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(
            width: screenWidth,
            onPressed: () {
              // Colors
              // NavigatorObserver()..navigator.;
              Navigator.pushNamed(context, AppRoutesName.cartScreen2);
            }),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              // Navigator.
              Navigator.popAndPushNamed(context, AppRoutesName.homeScreen,
                  arguments: getUserId());
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: AppColors.kShapesColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoutesName.homeScreen,
                    arguments: getUserId());
              },
              icon: Icon(
                Icons.home_outlined,
                size: screenWidth * 0.035,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
          ],
          title: Text(
            "product_details".tr(context),
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.white,
                  fontSize: screenWidth * 0.022,
                ),
          ),
          toolbarTextStyle: const TextStyle(color: Colors.pink),
        ),
        backgroundColor: AppColors.kBackGroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.01,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01,
              vertical: screenHeight * 0.01,
            ),
            child: BlocBuilder<ItemDetailCubit, ItemDetailState>(
              builder: (context, state) {
                if (state is ItemDetailSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // image Container
                      CustomImagePreview(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        imageName: state.itemDetailEntity.itemsImage.toString(),
                        // imageName: state.itemsEntity!.itemsImage.toString(),
                        itemId: state.itemDetailEntity.itemsId.toString(),
                        // itemId: itemsEntity!.itemsId.toString(),
                      ),
                      CustomItemsColors(
                        height: screenHeight,
                        width: screenWidth,
                      ),
                      // child: ,

                      //info
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // favorite Icon and cart Icon
                            IconsRow(
                              itemId: state.itemDetailEntity.itemsId.toString(),
                              screenWidth: screenWidth,
                              isInCart:
                                  state.itemDetailEntity.isInCart.toString(),
                              isInFav:
                                  state.itemDetailEntity.isInFav.toString(),
                            ),
                            //The name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    translateDataBaseLang(
                                      // state.itemDetailEntity.itemsNameAr
                                      //     .toString(),
                                      // itemsEntity!.itemsNameAr.toString(),
                                      state.itemDetailEntity.itemsNameAr
                                          .toString(),
                                      // state.itemDetailEntity.itemsName
                                      //     .toString(),
                                      state.itemDetailEntity.itemsName
                                          .toString(),
                                      // itemsEntity!.itemsName.toString(),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 20,
                                        ),
                                    "${state.itemDetailEntity.itemsPrice.toString()}\$",
                                    // "${itemsEntity!.itemsPrice.toString()}\$",
                                    // "${state.itemDetailEntity.itemsPrice.toString()}\$",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.001,
                            ),

                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            //Rate Stars
                            RateWidget(
                              screenWidth: screenWidth,
                              stars: state.itemDetailEntity.rateStars ?? 0,
                              itemId: state.itemDetailEntity.itemsId!.toInt(),
                              publicRate:
                                  state.itemDetailEntity.publicRate ?? 0.0,
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              // textAlign: TextAlign.center,
                              translateDataBaseLang(
                                state.itemDetailEntity.itemsDescriptionAr
                                    .toString(),
                                //     .toString(),
                                // itemsEntity!.itemsDescriptionAr.toString(),

                                state.itemDetailEntity.itemsDescription
                                    .toString(),
                                // itemsEntity!.itemsDescription.toString(),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: AppColors.grey2800,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      //here
                      CustomItemDetailsButton(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          title: "buy_now".tr(context),
                          onPressed: () {
                            List<CartDataEntity> items = [
                              CartDataEntity(
                                itemsId: state.itemDetailEntity.itemsId,
                                itemsDiscount:
                                    state.itemDetailEntity.itemsDiscount,
                                itemsCount: state.itemDetailEntity.itemsCount,
                                cartQuantity: 1,
                                status: state.itemDetailEntity.status,
                                isInCart: state.itemDetailEntity.isInCart,
                                isInFav: state.itemDetailEntity.isInFav,
                                itemsActive: state.itemDetailEntity.itemsActive,
                                itemsCategoriesId:
                                    state.itemDetailEntity.itemsCategoriesId,
                                itemsDateCreate:
                                    state.itemDetailEntity.itemsDateCreate,
                                itemsDescription:
                                    state.itemDetailEntity.itemsDescription,
                                itemsDescriptionAr:
                                    state.itemDetailEntity.itemsDescriptionAr,
                                itemsImage2: state.itemDetailEntity.itemsImage2,
                                itemsImage3: state.itemDetailEntity.itemsImage3,
                                itemsImage4: state.itemDetailEntity.itemsImage4,
                                itemsImage: state.itemDetailEntity.itemsImage,
                                itemsName: state.itemDetailEntity.itemsName,
                                itemsNameAr: state.itemDetailEntity.itemsNameAr,
                                itemsPrice: state.itemDetailEntity.itemsPrice,
                              ),
                            ];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PaymentScreen(
                                          cartDataEntity: items,
                                          total: (state.itemDetailEntity
                                                  .itemsPrice! -
                                              (state.itemDetailEntity
                                                      .itemsPrice! *
                                                  state.itemDetailEntity
                                                      .itemsDiscount! ~/
                                                  100)),
                                        )));
                          }),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Reviews",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Reviews(
                        size: size,
                        itemId: itemId,
                      ),
                    ],
                  );
                } else if (state is ItemDetailErrorState) {
                  return Center(child: Text(state.status));
                } else if (state is ItemDetailLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
