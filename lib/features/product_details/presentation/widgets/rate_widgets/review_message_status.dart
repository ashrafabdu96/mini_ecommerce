import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class AddOrUpdateReviewMessageStatus extends StatelessWidget {
  const AddOrUpdateReviewMessageStatus(
      {Key? key,
      required this.message,
      required this.size,
      required this.iconData})
      : super(key: key);
  final String message;
  final Size size;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        Icon(
          iconData,
          color: AppColors.kShapesColor,
          size: size.width * 0.15,
        ),
      ],
    );
  }
}
