import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomAddOrRemoveButton extends StatelessWidget {
  const CustomAddOrRemoveButton(
      {Key? key,
      required this.height,
      required this.width,
      this.onPressed,
      required this.icon})
      : super(key: key);
  final double height;
  final double width;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              width * 0.1,
            ),
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: AppColors.kShapesColor.withOpacity(0.5),
            width: 2,
          ),
        ),
      ),
      icon: CircleAvatar(
        radius: height * 0.095,
        backgroundColor: AppColors.kShapesColor,
        child: Icon(
          icon,
          color: AppColors.white,
          // size: constraint.maxWidth * 0.08,
        ),
      ),
    );
  }
}
