import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';
import 'package:mini_ecommerce/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:mini_ecommerce/features/favorite/presentation/widgets/favorite_image_product.dart';
import 'package:mini_ecommerce/injection_container.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.favoriteData,
      required this.index})
      : super(key: key);
  final double height;
  final double width;
  final FavoriteDataEntity favoriteData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, AppRoutesName.itemDetails,
            arguments: [favoriteData.itemsId]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //image and ExitButton
          Center(
            child: SizedBox(
              height: height * 0.6,
              child: FavoriteImageProduct(
                height: height * 0.7,
                width: width * 0.95,
                imageUrl:
                    "${ApiLinks.kLinkItemsImages}/${favoriteData.itemsImage}",
              ),
            ),
          ),

          SizedBox(
            height: height * 0.2,
            child: Padding(
              padding: EdgeInsets.only(
                right: getLang() == "ar" ? width * 0.05 : 0,
                left: getLang() == "en" ? width * 0.05 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      translateDataBaseLang(
                        favoriteData.itemsNameAr.toString(),
                        favoriteData.itemsName.toString(),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: height * 0.038,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      translateDataBaseLang(
                        favoriteData.itemsDescriptionAr.toString(),
                        favoriteData.itemsDescription.toString(),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: height * 0.034,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "11200\$",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kShapesColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => sl<CartCubit>(),
              child: Builder(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.04,
                    ),
                    SizedBox(
                      height: height * 0.14,
                      width: width * 0.18,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kShapesColor,
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {
                            BlocProvider.of<FavoriteCubit>(context)
                                .addToCartFromFavorite(
                              favoriteData.itemsId!.toInt(),
                              context,
                            );
                          },
                          icon: Icon(
                            Icons.add_shopping_cart_rounded,
                            color: AppColors.white,
                            size: width * 0.1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      height: height * 0.14,
                      width: width * 0.18,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kShapesColor,
                        ),
                        child: IconButton(
                          // alignment: Alignment.centerLeft,
                          onPressed: () {
                            BlocProvider.of<FavoriteCubit>(context)
                                .deleteFavorite(
                              favoriteData.itemsId!.toInt(),
                              context,
                            );
                            BlocProvider.of<FavoriteCubit>(context)
                                .favoriteProductsList
                                .removeWhere((element) =>
                                    element.itemsId == favoriteData.itemsId);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: AppColors.white,
                            size: width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
/****
    ElevatedButton(
    onPressed: () {
    BlocProvider.of<FavoriteCubit>(context)
    .addToCartFromFavorite(
    favoriteData.itemsId!.toInt(),
    context,
    );
    },
    style: ButtonStyle(
    padding:
    MaterialStatePropertyAll(EdgeInsets.only(bottom: 4)),
    side: MaterialStatePropertyAll(
    BorderSide(
    color: AppColors.kShapesColor,
    width: width * 0.02,
    ),
    ),
    ),
    child: Text(
    "Add to cart",
    style: Theme.of(context).textTheme.bodyText1!.copyWith(
    color: AppColors.kWhiteFonts,
    fontWeight: FontWeight.w400,
    fontSize: width * 0.06,
    ),
    textAlign: TextAlign.justify,
    ),
    ),
 */
