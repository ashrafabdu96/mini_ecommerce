import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class CustomImageCart extends StatelessWidget {
  const CustomImageCart(
      {Key? key,
      required this.height,
      required this.width,
      required this.imgUrl})
      : super(key: key);
  final double height;
  final double width;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width * 0.3,
      // margin: EdgeInsets.only(
      //   left: getLang() == "en" ? constraint.maxWidth * 0.0 : 0,
      //   right: getLang() == "ar" ? constraint.maxWidth * 0.0 : 0,
      //   // top: constraint.maxWidth * 0.025,
      // ),
      decoration: BoxDecoration(
        boxShadow: AppColors.containersShadow,
        border: Border.all(
          color: AppColors.grey2800.withOpacity(
            0.5,
          ),
          width: 1.5,
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: Image.network(
        "${ApiLinks.kLinkItemsImages}/$imgUrl",
        // height: innerLength.maxHeight,
        // width: innerLength.maxWidth,
        fit: BoxFit.contain,
      ),
    );
  }
}
