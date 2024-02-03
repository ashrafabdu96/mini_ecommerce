import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class NotificationCounter extends StatelessWidget {
  const NotificationCounter({
    Key? key,
    required this.height,
    required this.radius,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: constraint.maxHeight * 0.5,
      // width: constraint.maxHeight * 0.35,
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        child: const Center(
          child: Text(
            "1",
            style: TextStyle(
              color: AppColors.kWhiteFonts,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      // width: ,
    );
  }
}
