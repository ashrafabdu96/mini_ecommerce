import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/cart_components.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.cartDataEntity,
    required this.deletedIndex,
  }) : super(key: key);

  final double width;
  final double height;
  final CartDataEntity cartDataEntity;
  final int deletedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.015,
      ),
      padding: EdgeInsets.only(
          bottom: width * 0.01, left: width * 0.01, right: width * 0.01),
      height: height * 0.3,
      width: width,
      decoration: BoxDecoration(
        // color: AppColors.grey.withBlue(240),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          width * 0.01,
        ),
        boxShadow: AppColors.containersShadowTwo,
      ),
      child: LayoutBuilder(builder: (context, constraint) {
        return Center(
          child: CartComponents(
            cartDataEntity: cartDataEntity,
            width: constraint.maxWidth,
            height: constraint.maxHeight,
          ),
        );
      }),
    );
  }
}
