import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomLogOrSignText extends StatelessWidget {
  const CustomLogOrSignText({
    Key? key,
    this.onTap,
    required this.height,
    required this.width,
    required this.textOne,
    required this.textTwo,
    required this.widthSpace,
  }) : super(key: key);
  final double height;
  final double width;
  final double widthSpace;
  final String textOne;
  final String textTwo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            textOne,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
          ),
          SizedBox(
            width: widthSpace,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              //sign up
              textTwo,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                    color: AppColors.kBlackFonts,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
