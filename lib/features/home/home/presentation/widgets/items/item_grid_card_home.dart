import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/home_cubit.dart';

class ItemGridCard extends StatelessWidget {
  const ItemGridCard({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      width: width,
      color: AppColors.kBackGroundColor.withOpacity(0.5),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccessState) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: width * 0.04,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutesName.itemDetails,
                      arguments: [
                        state.homeEntity.allItems![index].itemsId,
                        state.homeEntity.allItems![index]
                      ],
                    );
                  },
                  child: ItemCardHome(
                    width: width,
                    allItemsEntity: state.homeEntity.allItems![index],
                  ),
                );
              },
              itemCount: state.homeEntity.allItems!.length,
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.status),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemCardHome extends StatelessWidget {
  const ItemCardHome({
    Key? key,
    required this.width,
    required this.allItemsEntity,
  }) : super(key: key);

  final double width;
  final AllItemsEntity allItemsEntity;
//here we will send the model
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
          child: Stack(
            children: [
              Center(
                child: Image.network(
                  "${ApiLinks.kLinkItemsImages}/${allItemsEntity.itemsImage}",
                  fit: BoxFit.contain,
                  height: width * 0.3,
                ),
              ),
              Container(
                height: width * 0.3,
                width: width,
                color: AppColors.black.withOpacity(0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    //   child: Text(
                    //     translateDataBaseLang(
                    //         allItemsEntity.itemsNameAr.toString(),
                    //         allItemsEntity.itemsName.toString()),
                    //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    //           color: AppColors.kWhiteFonts,
                    //           fontSize: width * 0.037,
                    //           shadows: AppColors.containersShadow,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //     textAlign: TextAlign.center,
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 2,
                    //   ),
                    // ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    Text(
                      "${allItemsEntity.itemsPrice.toString()}\$",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.white,
                          fontSize: width * 0.04,
                          shadows: AppColors.boxShadows,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
