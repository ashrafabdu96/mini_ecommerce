import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/injection_container.dart';

// const primaryColor = Color(0xffef7f5c);
const primaryColor = AppColors.kShapesColor;
const secondaryColor = Color(0xff51eec2);
// const  = Color(0xff51eec2);
final appTheme = ThemeData(
  //**** elevatedButtonTheme

  useMaterial3: false,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryColor),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5,
        ),
      ),
    ),
  ),
  //****textTheme
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: 0.3,
      height: 1.5,
      fontSize: 24,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: 0.3,
      height: 1.5,
      fontSize: 18,
    ),
  ),
  fontFamily: getLang() == "ar"
      ? 'Cairo'
      : getLang() == 'en'
          ? 'PlatyFairDisplay'
          : 'PlatyFairDisplay',
  //**** appBarTheme
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
  ),
  // ******floatingActionButtonTheme
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: primaryColor,
    // linearMinHeight: 20,
  ),
  //****** floatingActionButtonTheme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: secondaryColor,
  ),
  //****** InputDecorationTheme
  inputDecorationTheme: const InputDecorationTheme(
    suffixIconColor: AppColors.kAuthFieldsBordersColor,
    prefixIconColor: AppColors.kAuthFieldsBordersColor,
    floatingLabelStyle: TextStyle(
      fontSize: 20,
      color: AppColors.kShapesShadowColor2,
      fontWeight: FontWeight.bold,
    ),
    labelStyle: TextStyle(
      color: AppColors.kShapesShadowColor2,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    iconColor: secondaryColor,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        width: 4,
        color: AppColors.kAuthFieldsBordersColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide(
        width: 2,
        color: AppColors.kAuthFieldsBordersColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        width: 2,
        color: Color(0xff275210),
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    hintStyle: TextStyle(
      fontSize: 13,
      color: AppColors.kShapesShadowColor2,
      fontWeight: FontWeight.bold,
    ),
    filled: true,
    fillColor: Color(0xddffffff),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        width: 2,
        color: AppColors.kShapesColor,
      ),
    ),
  ),
);
final boxDecorationBorderStyle = BoxDecoration(
// color: Colors.white.withOpacity(1),
//   color: AppColors.grey.withOpacity(0.6),
  borderRadius: BorderRadius.circular(5),
  border: Border.all(width: 2.5, color: AppColors.kAuthFieldsBordersColor),
  boxShadow: const [
    BoxShadow(
      color: AppColors.kShapesColor,
      blurRadius: 5,
      spreadRadius: 5,
      blurStyle: BlurStyle.outer,
    ),
  ],
);
