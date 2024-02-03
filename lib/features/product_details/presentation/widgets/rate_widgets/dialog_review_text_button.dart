import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class DialogReviewTextButton extends StatelessWidget {
  const DialogReviewTextButton({Key? key, this.onPressed, required this.title})
      : super(key: key);
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.kShapesColor,
            ),
      ),
    );
  }
}
