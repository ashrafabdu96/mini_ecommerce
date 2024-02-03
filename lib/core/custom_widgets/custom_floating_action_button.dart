import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {Key? key, required this.width, required this.onPressed})
      : super(key: key);
  final double width;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.kShapesColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grey2800.withAlpha(150), width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(
            width * 0.1,
          ),
        ),
      ),
      child: const Icon(
        Icons.shopping_cart_outlined,
        color: AppColors.white,
      ),
    );
  }
}
