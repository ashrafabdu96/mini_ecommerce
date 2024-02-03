import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class OfferIndicator extends StatelessWidget {
  const OfferIndicator({
    Key? key,
    required this.height,
    required this.width,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: width * 0.03,
      width: isActive ? width * 0.06 : width * 0.03,
      margin: EdgeInsets.symmetric(horizontal: width * 0.005),
      decoration: BoxDecoration(
        color: isActive ? AppColors.kShapesColor : AppColors.grey.withAlpha(1),
        border: Border.all(color: AppColors.kAuthFieldsBordersColor, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
