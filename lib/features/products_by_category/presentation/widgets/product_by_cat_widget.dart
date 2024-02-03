import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/entities/product_by_cat_entity.dart';

class ProductByCatWidget extends StatelessWidget {
  const ProductByCatWidget(
      {Key? key,
      required this.productsDataByCatEntity,
      required this.maxHeight,
      required this.maxWidth})
      : super(key: key);
  final ProductByCatDataEntity productsDataByCatEntity;
  final double maxHeight;
  final double maxWidth;
  @override
  Widget build(BuildContext context) {
    print("item by cat=>$productsDataByCatEntity");
    return Container(
      height: maxHeight * 0.25,
      width: maxWidth * 0.5,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.0),
        boxShadow: AppColors.containersShadow,
        borderRadius: BorderRadius.all(
          Radius.circular(maxWidth * 0.02),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: maxWidth * 0.03,
      ),
      child: LayoutBuilder(builder: (context, constraint) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutesName.itemDetails,
              arguments: [
                productsDataByCatEntity.itemsId,
                productsDataByCatEntity
              ],
            );
          },
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(constraint.maxWidth * 0.05),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.network(
                            height: constraint.maxHeight * 0.6,
                            "${ApiLinks.kLinkItemsImages}/${productsDataByCatEntity.itemsImage}",
                            fit: BoxFit.contain,
                            // alignment: Alignment.topCenter,
                          ),
                        ),
                        //the container infront of the image
                        Container(
                          height: constraint.maxHeight * 0.6,
                          color: AppColors.grey2800.withOpacity(0.3),
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.symmetric(
                              horizontal: constraint.maxWidth * 0.04,
                              vertical: constraint.maxWidth * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: constraint.maxWidth * 0.085,
                                backgroundColor: AppColors.kBackGroundColor,
                                child: Icon(
                                  productsDataByCatEntity.isInFav == "inFav"
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: AppColors.kShapesColor,
                                  shadows: const [
                                    BoxShadow(
                                        color: AppColors.white,
                                        blurRadius: 10,
                                        spreadRadius: 4)
                                  ],
                                  size: maxWidth * 0.06, //**
                                ),
                              ),
                              SizedBox(
                                width: maxWidth * 0.03, //**
                              ),
                              CircleAvatar(
                                radius: constraint.maxWidth * 0.085,
                                backgroundColor: AppColors.kBackGroundColor,
                                child: Icon(
                                  productsDataByCatEntity.isInCart == "inCart"
                                      ? Icons.shopping_cart
                                      : Icons.shopping_cart_outlined,
                                  color: AppColors.kShapesColor,
                                  shadows: const [
                                    BoxShadow(
                                        color: AppColors.white,
                                        blurRadius: 10,
                                        spreadRadius: 4)
                                  ],
                                  size: maxWidth * 0.06, //**
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    translateDataBaseLang(
                        productsDataByCatEntity.itemsNameAr.toString(),
                        productsDataByCatEntity.itemsName.toString()),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: constraint.maxHeight * 0.055,
                        ),
                  ),
                  Text(
                    translateDataBaseLang(
                        productsDataByCatEntity.itemsDescriptionAr.toString(),
                        productsDataByCatEntity.itemsDescription.toString()),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: constraint.maxHeight * 0.04),
                  ),
                  SizedBox(
                    height: constraint.maxHeight * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productsDataByCatEntity.itemsPrice.toString().length >
                                  8
                              ? "${productsDataByCatEntity.itemsPrice.toString().substring(0, 8)}\$.."
                              : "${productsDataByCatEntity.itemsPrice.toString()}\$",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: constraint.maxHeight * 0.055),
                        ),
                        Row(
                          children: [
                            Text(
                              "${4.5}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Colors.greenAccent,
                                      fontSize: constraint.maxHeight * 0.055),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent.shade700,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(maxWidth * -0.01, 8),
                child: Container(
                  height: maxHeight * 0.033,
                  width: maxWidth * 0.11,
                  decoration: BoxDecoration(
                    color: AppColors.kShapesColor,
                    borderRadius: BorderRadius.circular(
                      maxWidth * 0.1,
                    ),
                  ),
                  child: Text(
                    "${productsDataByCatEntity.itemsDiscount.toString()}%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.kWhiteFonts,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
