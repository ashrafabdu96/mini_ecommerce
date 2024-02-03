import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

showSnackMessage({
  required BuildContext context,
  required String message,
  required Color bkgColor,
  required Color textColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // dismissDirection: DismissDirection.,
      behavior: SnackBarBehavior.floating,

      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: AppColors.kShapesColor,
      // duration: const Duration(milliseconds: 150),
    ),
  );
}
