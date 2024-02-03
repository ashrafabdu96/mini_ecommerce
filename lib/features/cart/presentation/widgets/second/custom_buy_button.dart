import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomBuyButton extends StatelessWidget {
  const CustomBuyButton({
    Key? key,
    required this.height,
    required this.width,
    this.onTap,
    required this.title,
  }) : super(key: key);
  final double height;
  final double width;
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.kShapesColor,
              borderRadius: BorderRadius.circular(
                width * 0.05,
              ),
              boxShadow: AppColors.containersShadow,
              border: Border.all(
                  color: AppColors.grey2800.withOpacity(
                    0.6,
                  ),
                  width: 1.5)),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height * 0.5,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
