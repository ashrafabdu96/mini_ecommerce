import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';

class OrderDescriptionButton extends StatelessWidget {
  const OrderDescriptionButton(
      {Key? key, required this.height, required this.width, this.onPressed})
      : super(key: key);
  final double height;
  final double width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColors.kShapesColor,
        ),
      ),
      child: Text(
        "details".tr(context),
        style: TextStyle(
          color: AppColors.kWhiteFonts,
          fontSize: height * 0.099,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
