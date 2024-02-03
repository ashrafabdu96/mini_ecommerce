import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.height,
    required this.width,
    this.onTap,
  }) : super(key: key);

  final double height;
  final double width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.kShapesColor,
        ),
        height: height * 0.17,
        width: width * 0.17,
        child: const Icon(
          Icons.close_outlined,
          color: AppColors.white,
        ),
      ),
    );
  }
}
