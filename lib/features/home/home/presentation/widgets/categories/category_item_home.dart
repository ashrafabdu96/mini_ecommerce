import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class CategoryItemHome extends StatelessWidget {
  const CategoryItemHome({
    Key? key,
    required this.categoryEntity,
    required this.height,
    required this.width,
    required this.categoriesEntity,
  }) : super(key: key);
  final CategoriesEntity categoryEntity;
  final double height;
  final double width;

  final List<CategoriesEntity> categoriesEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.12,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutesName.itemByCatScreen,
              arguments: [categoryEntity.categoriesId, categoriesEntity],
            );
          },
          child: Container(
            height: height * 0.6,
            width: width * 0.2,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey2800,
                width: 1.5,
              ),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(width * 0.04),
              //   bottomRight: Radius.circular(width * 0.04),
              // ),
              borderRadius: BorderRadius.circular(width * 0.02),
              // shape: BoxShape.circle,
              color: Color(0xa0f29274),
              boxShadow: AppColors.containersShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(width * 0.08),
              child: Padding(
                padding: EdgeInsets.all(width * 0.024),
                child: SvgPicture.network(
                  "${ApiLinks.kLinkCategoriesImages}/${categoryEntity.categoriesImage}",
                  alignment: Alignment.center,
                  placeholderBuilder: (context) =>
                      const Icon(Icons.account_balance),
                  fit: BoxFit.scaleDown,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // height: 0.5,
                  // width: 0.5,
                  color: const Color(0xff3a0f01),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Text(
          translateDataBaseLang(categoryEntity.categoriesNameAr.toString(),
              categoryEntity.categoriesName.toString()),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.grey2800,
                fontSize: width * 0.03,
              ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        )
      ],
    );
  }
}

class CategoryItemHome2 extends StatelessWidget {
  const CategoryItemHome2({
    Key? key,
    required this.categoryEntity,
    required this.height,
    required this.width,
    required this.categoriesEntity,
  }) : super(key: key);
  final CategoriesEntity categoryEntity;
  final double height;
  final double width;

  final List<CategoriesEntity> categoriesEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width * 0.3,
      child: LayoutBuilder(builder: (context, constraint) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutesName.itemByCatScreen,
                  arguments: [categoryEntity.categoriesId, categoriesEntity],
                );
              },
              child: Container(
                  height: constraint.maxHeight * 0.8,
                  width: constraint.maxWidth,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey2800,
                      width: 1,
                    ),
                    boxShadow: AppColors.containersShadow,
                    color: AppColors.white,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(constraint.maxWidth * 0.2),
                      right: Radius.circular(constraint.maxWidth * 0.2),
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      // image container
                      Container(
                        height: constraint.maxHeight * 0.62,
                        width: constraint.maxWidth * 0.32,
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: constraint.maxWidth * 0.02),
                        child: SvgPicture.network(
                            "${ApiLinks.kLinkCategoriesImages}/${categoryEntity.categoriesImage}",
                            alignment: Alignment.center,
                            placeholderBuilder: (context) =>
                                const Icon(Icons.account_balance),
                            fit: BoxFit.scaleDown,
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                            // height: height * 0.3,
                            // width: width * 0.2,
                            color: categoryEntity.categoriesName ==
                                    "smart phones"
                                ? const Color(0xc3977aad)
                                : categoryEntity.categoriesName == "dresses"
                                    ? const Color(0xffe11313)
                                    : categoryEntity.categoriesName == "Laptops"
                                        ? null
                                        : null),
                      ),
                      // categoryName
                      Expanded(
                        child: Center(
                          child: Text(
                            translateDataBaseLang(
                                categoryEntity.categoriesNameAr.toString(),
                                categoryEntity.categoriesName.toString()),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey2800,
                                      fontSize: constraint.maxWidth * 0.11,
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        );
      }),
    );
    // return Column(
    //   children: [
    //     // SizedBox(
    //     //   height: height * 0.12,
    //     // ),
    //     ///image
    //     InkWell(
    //       onTap: () {
    //         Navigator.pushNamed(
    //           context,
    //           AppRoutesName.itemByCatScreen,
    //           arguments: [categoryEntity.categoriesId, categoriesEntity],
    //         );
    //       },
    //       child: Container(
    //         height: height * 0.4,
    //         width: width * 0.3,
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: AppColors.grey2800,
    //             width: 1.5,
    //           ),
    //           // borderRadius: BorderRadius.only(
    //           //   topLeft: Radius.circular(width * 0.04),
    //           //   bottomRight: Radius.circular(width * 0.04),
    //           // ),
    //           borderRadius: BorderRadius.horizontal(
    //             left: Radius.circular(width * 0.1),
    //             right: Radius.circular(width * 0.1),
    //           ),
    //           // shape: BoxShape.circle,
    //           color: Color(0xa0f29274),
    //           boxShadow: AppColors.containersShadow,
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.all(width * 0.018),
    //               child: Container(
    //                 height: height * 0.3,
    //                 width: width * 0.2,
    //                 child: SvgPicture.network(
    //                   "${ApiLinks.kLinkCategoriesImages}/${categoryEntity.categoriesImage}",
    //
    //                   alignment: Alignment.center,
    //                   placeholderBuilder: (context) =>
    //                       const Icon(Icons.account_balance),
    //                   fit: BoxFit.scaleDown,
    //                   // clipBehavior: Clip.antiAliasWithSaveLayer,
    //                   height: height * 0.3,
    //                   width: width * 0.2,
    //                   color: const Color(0xff3a0f01),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               width: width * 0.01,
    //             ),
    //
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       height: height * 0.05,
    //     ),Text(
    //     //               translateDataBaseLang(
    //     //                   categoryEntity.categoriesNameAr.toString(),
    //     //                   categoryEntity.categoriesName.toString()),
    //     //               style: Theme.of(context).textTheme.bodyText2!.copyWith(
    //     //                     fontWeight: FontWeight.bold,
    //     //                     color: AppColors.grey2800,
    //     //                     fontSize: width * 0.03,
    //     //                   ),
    //     //               maxLines: 1,
    //     //               overflow: TextOverflow.ellipsis,
    //     //               softWrap: true,
    //     //             )
    //   ],
    // );
  }
}
