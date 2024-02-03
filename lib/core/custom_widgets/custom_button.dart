import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.onTap,
    required this.height,
    required this.width,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(),
          onPressed: onTap,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                  shadows: AppColors.boxCategoriesShadows,
                ),
          )),
    );
  }
}
