import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/orders/presentation/widgets/order_description_button.dart';

class OrderDescription extends StatelessWidget {
  const OrderDescription({
    Key? key,
    required this.height,
    required this.width,
    this.firstTitle,
    required this.secondTitle,
    required this.isWithButton,
    this.onPressed,
  }) : super(key: key);
  final double height;
  final double width;
  final String? firstTitle;
  final String secondTitle;
  final bool isWithButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      height: height * 0.2,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isWithButton
              ? OrderDescriptionButton(
                  height: height,
                  width: width,
                  onPressed: onPressed,
                )
              : Text(
                  // "OrderNo:55255",
                  firstTitle ?? '',
                  style: TextStyle(
                    fontSize: height * 0.099,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          Text(
            // "25/12/2022",
            secondTitle,
            style: TextStyle(
              fontSize: height * 0.099,
              fontWeight: FontWeight.bold,
              color: AppColors.grey1,
            ),
          ),
        ],
      ),
    );
  }
}
