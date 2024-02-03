import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget(
      {Key? key, required this.height, required this.title, this.fontSize})
      : super(key: key);
  final double height;
  final String title;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
              color: AppColors.kShapesColor,
            ),
      ),
    );
  }
}
