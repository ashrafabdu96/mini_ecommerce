import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomAuthTxtTitle extends StatelessWidget {
  const CustomAuthTxtTitle({
    Key? key,
    required this.height,
    required this.title,
    required this.fontSize,
  }) : super(key: key);
  final double height;
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: constraint.maxHeight * 0.07,
      height: height,
      child: Text(
        // '8'.tr,
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1!.copyWith(
              color: AppColors.kShapesShadowColor2,
              // shadows: AppColors.boxShadows,
              letterSpacing: 1.5,
              fontSize: fontSize,
              // shadows: AppColors.boxShadows,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
