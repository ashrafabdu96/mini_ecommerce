import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class RatePercentage extends StatelessWidget {
  const RatePercentage({Key? key, required this.text, required this.text2})
      : super(key: key);
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(
              color: AppColors.kBlackFonts,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              fontWeight: FontWeight.bold),
          children: [
            const WidgetSpan(
                child: Icon(
              shadows: AppColors.boxCategoriesShadows,
              Icons.star,
              color: Color(0xffE78335),
            )),
            WidgetSpan(
              child: Text(
                textAlign: TextAlign.end,
                text2,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColors.grey2800,
                      fontSize: 12,
                    ),
              ),
            ),
          ]),
    );
  }
}
