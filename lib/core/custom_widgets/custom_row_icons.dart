import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomRowIcons extends StatelessWidget {
  const CustomRowIcons({
    Key? key,
    required this.maxWidth,
    required this.isInFav,
    required this.isInCart,
  }) : super(key: key);

  final double maxWidth;
  final String isInFav;
  final String isInCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: maxWidth * 0.034,
          backgroundColor: AppColors.kBackGroundColor,
          child: Icon(
            isInFav == "inFav" ? Icons.favorite : Icons.favorite_outline,
            color: AppColors.kShapesColor,
            shadows: const [
              BoxShadow(color: AppColors.white, blurRadius: 10, spreadRadius: 4)
            ],
            size: maxWidth * 0.06, //**
          ),
        ),
        SizedBox(
          width: maxWidth * 0.03, //**
        ),
        CircleAvatar(
          radius: maxWidth * 0.034,
          backgroundColor: AppColors.kBackGroundColor,
          child: Icon(
            isInCart == "inCart"
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined,
            color: AppColors.kShapesColor,
            shadows: const [
              BoxShadow(color: AppColors.white, blurRadius: 10, spreadRadius: 4)
            ],
            size: maxWidth * 0.06, //**
          ),
        ),
      ],
    );
  }
}
