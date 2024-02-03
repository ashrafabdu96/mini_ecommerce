import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextFormFieldAddress extends StatelessWidget {
  const CustomTextFormFieldAddress({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.controller,
    this.validator,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: Icon(suffixIcon),
      ),
      cursorColor: AppColors.black,
    );
  }
}
