import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';

var email = "tony@starkindustries.com";
validInput(String value, int min, int max, String type, context) {
  if (value.isEmpty) {
    return "empty_field".tr(context);
  }

  if (type == 'email') {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailValid) {
      return "not_valid_email".tr(context);
    }
  }

  if (value.length < min) {
    return "${"can't_be_less_than".tr(context)} $min";
  }
  if (value.length > max) {
    return "${"can't_be_more_than".tr(context)}$max";
  }
  return null;
}

validIfNull({required String value, required BuildContext context}) {
  if (value.isEmpty) {
    return "empty_field".tr(context);
  } else {
    return null;
  }
}
