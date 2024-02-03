import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomItemDetailsButton extends StatelessWidget {
  const CustomItemDetailsButton(
      {Key? key,
      required this.screenWidth,
      required this.screenHeight,
      required this.title,
      this.onPressed})
      : super(key: key);
  final double screenWidth;
  final double screenHeight;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        // BlocProvider.of<ItemDetailCubit>(context).refreshes();
        // controller.isInCart == false
        //     ? controller.addToCart()
        //     : controller.deleteFromCart();

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.kShapesColor),
          padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenHeight * 0.015,
            ),
          ),
        ),
        child: Text(
          // textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColors.white,
                fontSize: 14,
              ),
        ));
  }
}
