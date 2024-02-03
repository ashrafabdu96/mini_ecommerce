import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/helpers/valid_input.dart';

import '../cubit/address_cubit.dart';

class CustomDropDownButtonCityField extends StatelessWidget {
  const CustomDropDownButtonCityField({
    Key? key,
    required this.size,
    required this.hint,
  }) : super(key: key);
  final Size size;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      autovalidateMode: AutovalidateMode.always,
      disabledHint: const Text("City"),
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
      value: null,
      items: BlocProvider.of<AddressCubit>(context)
          .cityEntityDataList!
          .map(
            (e) => DropdownMenuItem(
              value: e.cityId.toString(),
              child: Text(
                '${e.cityId}- ${e.cityName}',
              ),
            ),
          )
          .toList(),
      onChanged: (c) {
        BlocProvider.of<AddressRegionCubit>(context).getRegion(
          context,
          int.parse(
            c.toString(),
          ),
        );
      },
      iconSize: size.width * 0.06,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
    );
  }
}

// List<String?> cites = [null, "sanaa", "taiz", "aden", "dhamar"];
// BlocProvider.of<AddressCubit>(context)
// .cityEntityDataList!
// .map(
// (e) => DropdownMenuItem(
// value: e.cityId.toString(),
// child: Text(
// e.cityName.toString(),
// ),
// ),
// )
// .toList(),
