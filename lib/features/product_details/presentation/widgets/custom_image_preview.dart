import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/item_variation/item_variation_cubit.dart';

class CustomImagePreview extends StatelessWidget {
  const CustomImagePreview({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.imageName,
    required this.itemId,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String imageName;
  final String itemId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          screenWidth * 0.02,
        ),
        color: AppColors.white,
        boxShadow: AppColors.containersShadow,
        // boxShadow: AppColors.boxCategoriesShadows
      ),
      height: screenHeight * 0.5,
      child: BlocBuilder<ItemVariationCubit, ItemVariationState>(
        builder: (context, state) {
          if (state is ItemVariationSuccessState) {
            return PageView.builder(
              itemCount: state.itemVariationEntity.itemVariationsData!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ///image
                    Expanded(
                      child: Image.network(
                        // height: constraint.maxHeight,
                        // "${ApiLinks.kLinkItemsImages}/${""}",
                        "${ApiLinks.kLinkItemsImages}/${state.itemVariationEntity.itemVariationsData![index].imageName}",
                        fit: BoxFit.scaleDown,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/images/phone.png'),
                      ),
                    ),

                    ///number of images
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(200),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(
                            screenWidth * 0.015,
                          ),
                          left: Radius.circular(
                            screenWidth * 0.015,
                          ),
                        ),
                      ),
                      height: screenWidth * 0.03,
                      width: screenWidth * 0.05,
                      margin: EdgeInsets.only(
                        bottom: screenWidth * 0.01,
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}/3",
                          style: TextStyle(
                            fontSize: screenWidth * 0.015,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is ItemVariationLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                ///image
                Expanded(
                  child: Image.network(
                    // height: constraint.maxHeight,
                    // "${ApiLinks.kLinkItemsImages}/${""}",

                    "${ApiLinks.kLinkItemsImages}/$imageName",

                    fit: BoxFit.scaleDown,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/phone.png'),
                  ),
                ),

                ///number of images
              ],
            );
          }
        },
      ),
    );
  }
}
