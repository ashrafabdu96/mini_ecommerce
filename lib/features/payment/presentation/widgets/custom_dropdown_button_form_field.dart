import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/helpers/valid_input.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField(
      {Key? key,
      required this.cityOrRegion,
      required this.size,
      required this.hint,
      required this.isCity,
      required this.onChange,
      this.value})
      : super(key: key);
  final String? value;
  final List cityOrRegion;
  final Size size;
  final String hint;
  final bool isCity;
  final void Function(dynamic) onChange;
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return isCity
        ? DropdownButtonFormField(
            autovalidateMode: AutovalidateMode.always,
            // disabledHint: const Text("City"),
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              label: Row(
                children: [
                  Text(
                    hint,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: size.width * 0.03),
                  ),
                  Icon(
                    Icons.star,
                    size: size.width * 0.025,
                    color: Colors.red,
                    // color: ,
                  )
                ],
              ),
            ),
            isDense: true,
            validator: (val) {
              // return val == null ? "empty_field".tr(context) : null;
              return validIfNull(value: val.toString(), context: context);
            },
            value: value,
            items: cityOrRegion
                .map(
                  (e) => DropdownMenuItem(
                    value: e.cityId.toString(),
                    child: Text(
                      '${e.cityId}- ${e.cityName}',
                    ),
                  ),
                )
                .toList(),
            onChanged: onChange,
            // onChanged: (c) {
            //   // BlocProvider.of<AddressRegionCubit>(context).getRegion(
            //   //   context,
            //   //   int.parse(
            //   //     c.toString(),
            //   //   ),
            //   // );
            // },
            iconSize: size.width * 0.06,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
          )
        : DropdownButtonFormField(
            autovalidateMode: AutovalidateMode.always,
            // disabledHint: const Text("City"),
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              label: Row(
                children: [
                  Text(
                    hint,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: size.width * 0.03),
                  ),
                  Icon(
                    Icons.star,
                    size: size.width * 0.025,
                    color: Colors.red,
                    // color: ,
                  )
                ],
              ),
            ),
            isDense: true,
            validator: (val) {
              // return val == null ? "empty_field".tr(context) : null;
              return validIfNull(value: val.toString(), context: context);
            },
            value: value,
            items: cityOrRegion
                .map(
                  (e) => DropdownMenuItem(
                    value: e.addressId.toString(),
                    child: Text(
                      '${e.region}',
                    ),
                  ),
                )
                .toList(),
            onChanged: onChange,
            // onChanged: (c) {
            //   // BlocProvider.of<AddressRegionCubit>(context).getRegion(
            //   //   context,
            //   //   int.parse(
            //   //     c.toString(),
            //   //   ),
            //   // );
            // },
            iconSize: size.width * 0.06,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
          );
  }
}
