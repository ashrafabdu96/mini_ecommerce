import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/CategoryItemsEntity.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {Key? key,
      required this.categoryItemEntity,
      required this.categoryItemsEntity})
      : super(key: key);
  final CategoryItemEntity categoryItemEntity;
  final List categoryItemsEntity;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            size.width * 0.05,
          ),
          // border: Border.all(
          //   color: AppColors.kShapesColor,
          //   width: 2,
          // ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size.width * 0.05),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutesName.itemByCatScreen,
                arguments: [
                  categoryItemEntity.categoriesId,
                  categoryItemsEntity
                ],
              );
            },
            child: Card(
              shadowColor: AppColors.kShapesColor,
              surfaceTintColor: Colors.pink,
              color: AppColors.white,
              elevation: 8,
              child: LayoutBuilder(builder: (context, constraint) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: constraint.maxHeight * 0.35,
                      child: SvgPicture.network(
                        "${ApiLinks.kLinkCategoriesImages}/${categoryItemEntity.categoriesImage}",
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.13,
                      child: Text(
                        translateDataBaseLang(
                          categoryItemEntity.categoriesNameAr.toString(),
                          categoryItemEntity.categoriesName.toString(),
                        ),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: constraint.maxWidth * 0.08,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
