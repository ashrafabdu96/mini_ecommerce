import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {Key? key,
      required this.allItemEntity,
      required this.maxHeight,
      required this.maxWidth})
      : super(key: key);
  final AllItemsEntity allItemEntity;
  final double maxHeight;
  final double maxWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight * 0.4,
      width: maxWidth * 0.55,
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
            Navigator.pushNamed(context, AppRoutesName.itemDetails,
                arguments: [allItemEntity.itemsId, allItemEntity]);
          },
          child: SizedBox(
            height: maxHeight,
            width: maxWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(constraint.maxWidth * 0.05),
                  child: Stack(
                    children: [
                      Image.network(
                        height: constraint.maxHeight * 0.6,
                        "${ApiLinks.kLinkItemsImages}/${allItemEntity.itemsImage}",
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      Container(
                        height: constraint.maxHeight * 0.6,
                        width: constraint.maxWidth,
                        color: AppColors.grey2800.withOpacity(0.3),
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.symmetric(
                            horizontal: constraint.maxWidth * 0.04,
                            vertical: constraint.maxWidth * 0.044),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: constraint.maxWidth * 0.085,
                              backgroundColor: AppColors.kBackGroundColor,
                              child: Icon(
                                allItemEntity.isInFav == "inFav"
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: AppColors.kShapesColor,
                                shadows: const [
                                  BoxShadow(
                                      color: AppColors.white,
                                      blurRadius: 10,
                                      spreadRadius: 4)
                                ],
                                size: constraint.maxWidth * 0.15, //**
                              ),
                            ),
                            SizedBox(
                              width: constraint.maxWidth * 0.06, //**
                            ),
                            CircleAvatar(
                              radius: constraint.maxWidth * 0.085,
                              backgroundColor: AppColors.kBackGroundColor,
                              child: Icon(
                                allItemEntity.isInCart == "inCart"
                                    ? Icons.shopping_cart
                                    : Icons.shopping_cart_outlined,
                                color: AppColors.kShapesColor,
                                shadows: const [
                                  BoxShadow(
                                      color: AppColors.white,
                                      blurRadius: 10,
                                      spreadRadius: 4)
                                ],
                                size: constraint.maxWidth * 0.15, //**
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  allItemEntity.itemsName.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: constraint.maxHeight * 0.022,
                      ),
                ),
                Text(
                  "${allItemEntity.itemsDescription}".toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: constraint.maxHeight * 0.045),
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        allItemEntity.itemsPrice.toString().length > 8
                            ? "${allItemEntity.itemsPrice.toString().substring(0, 8)}\$.."
                            : "${allItemEntity.itemsPrice.toString()}\$",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: constraint.maxHeight * 0.06,
                            ),
                        maxLines: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            "${4.5}",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.greenAccent,
                                      fontSize: constraint.maxHeight * 0.06,
                                    ),
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
          ),
        );
      }),
    );
  }
}
