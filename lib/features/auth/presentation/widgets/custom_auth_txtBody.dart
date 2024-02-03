import 'package:flutter/material.dart';

class CustomAuthTxtBody extends StatelessWidget {
  const CustomAuthTxtBody({
    Key? key,
    required this.height,
    required this.bodyTxt,
    required this.fontSize,
  }) : super(key: key);
  final double height;
  final double fontSize;
  final String bodyTxt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Text(
        //login With email and password
        // '10'.tr,
        bodyTxt,
        maxLines: 3,
        softWrap: true,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold, fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
