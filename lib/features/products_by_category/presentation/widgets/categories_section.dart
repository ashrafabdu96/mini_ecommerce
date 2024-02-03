import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key? key,
    this.categoriesEntity,
    required this.maxWidth,
    required this.maxHeight,
  }) : super(key: key);
  final List? categoriesEntity;
  final double maxWidth;

  final double maxHeight;

  @override
  build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: maxHeight * 0.02),
      width: maxWidth,
      height: maxHeight * 0.17,
      // color: AppColors.grey2800,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.0),
        // boxShadow: AppColors.containersShadow,
      ),
      padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: maxWidth * 0.018,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryEntity: categoriesEntity![index],
            height: maxHeight * 0.1,
            width: maxWidth * 0.9,
          );
        },
        itemCount: categoriesEntity!.length,
      ),
    );
  }
}

///********************************************
