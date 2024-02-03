import 'package:flutter/material.dart';

class AppColors {
  static Color grey = Colors.grey.shade200;
  static const Color white = Colors.white;
  static const Color fontCardItemColor = Colors.white;
  static const Color grey2800 = Color.fromARGB(255, 66, 66, 66);
  static const Color kBackGroundColor = Color(0xffF8F9FD);
  // static const Color kShapesColor = Color(0xffef7f5c);past
  // static const Color kOrangeFontColor = Color(0xffffb57d);
  static const Color kOrangeFontColor = Color(0xff0a0909);
  // static const Color kShapesColor = Color(0xffE8C872); //supported
  // static const Color kShapesColor = Color(0xff9599ec); /////supported
  static const Color kShapesColor = Color(0xffef7f5c); //supported
  // static const Color kShapesColor = Color(0xe5534b85); //supported
  // static const Color kShapesColor = Color(0xfa731234);
  static const Color kShapesColor2 = Color(0xfff29274);
  static const Color kShapesShadowColor = Color(0xdb1f000d);
  static const Color kShapesShadowColor2 = Color(0xff4d2101);
  static const Color kBlackFonts = Color(0xdb1f000d);
  static const Color kWhiteFonts = Color(0xffffffff);
  static const Color kAuthFieldsBordersColor = Color(0xdb4f1b31);
  static const List<BoxShadow> containersShadow = [
    BoxShadow(
        color: AppColors.grey2800,
        blurStyle: BlurStyle.outer,
        spreadRadius: -2,
        blurRadius: 5)
  ];

  static const List<BoxShadow> containersShadowTwo = [
    BoxShadow(
        color: AppColors.grey2800,
        blurStyle: BlurStyle.outer,
        spreadRadius: -1,
        blurRadius: 4,
        offset: Offset(2, 2)),
    BoxShadow(
        color: AppColors.grey2800,
        blurStyle: BlurStyle.outer,
        spreadRadius: -1,
        blurRadius: 4,
        offset: Offset(-2, -2))
  ];
  static List<BoxShadow> boxShadows = [
    const BoxShadow(
      color: Colors.white,
      blurRadius: 4,
      spreadRadius: 1,
      offset: Offset(0.5, 0.5),
    ),
    const BoxShadow(
      color: Colors.white,
      blurRadius: 2,
      spreadRadius: 0.5,
      offset: Offset(-0.5, -0.5),
    ),
    const BoxShadow(
      color: AppColors.kShapesShadowColor,
      blurRadius: 4,
      spreadRadius: 0.5,
      offset: Offset(1.5, 1.5),
    ),
    const BoxShadow(
      color: AppColors.kShapesShadowColor,
      blurRadius: 0,
      spreadRadius: 0.5,
      offset: Offset(-1.5, -1.5),
    ),
  ];
  static const List<BoxShadow> boxCategoriesShadows = [
    BoxShadow(
      color: Color(0x4157118c),
      blurRadius: 0.5,
      spreadRadius: 0.2,
      offset: Offset(1, 1),
    ),
    BoxShadow(
      color: kShapesColor,
      blurRadius: 0.5,
      spreadRadius: 0.1,
      offset: Offset(-0.5, -0.5),
    ),
    BoxShadow(
      color: Color(0x5e731234),
      blurRadius: 0.2,
      spreadRadius: 0.1,
      offset: Offset(1, 1),
    ),
    BoxShadow(
      color: Color(0xe06b2007),
      // blurRadius:0.5,
      spreadRadius: 0.2,
      offset: Offset(0, 0),
    ),
  ];

  static const Color grey1 = Color(0xff8e8e8e);
  static const Color black = Color(0xff000000);
}
