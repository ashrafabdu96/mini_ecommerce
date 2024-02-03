import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/screen_config.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: AppColors.kBlackFonts,
                fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              "see_more".tr(context),
              style: const TextStyle(
                  color: AppColors.kBlackFonts, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
