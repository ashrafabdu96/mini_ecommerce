import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/helpers/valid_input.dart';

class CustomTextFieldAddress extends StatelessWidget {
  const CustomTextFieldAddress(
      {Key? key,
      required this.size,
      required this.maxLines,
      this.controller,
      required this.label,
      required this.maxLength,
      this.textInputType})
      : super(key: key);
  final Size size;
  final int maxLines;
  final TextEditingController? controller;
  final String label;
  final int maxLength;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      validator: (val) {
        return validIfNull(value: val.toString(), context: context);
        // return val!.isNotEmpty ? "Cant Be Null" : null;
      },
      maxLength: maxLength,
      cursorHeight: size.width * 0.05,
      maxLines: maxLines,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffix: textInputType == TextInputType.phone
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.keyboard_arrow_down_outlined),
                  Text("+967"),
                ],
              )
            : null,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // er
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        label: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
            Icon(
              Icons.star,
              size: size.width * 0.025,
              color: Colors.red,
              // color: ,
            )
          ],
        ),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
