import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/helpers/valid_input.dart';
import 'package:mini_ecommerce/features/address/presentation/cubit/address_cubit.dart';

class CustomDropDownButtonRegionField extends StatelessWidget {
  const CustomDropDownButtonRegionField({
    Key? key,
    this.size,
    this.hint,
  }) : super(key: key);
  final Size? size;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressRegionCubit, AddressRegionState>(
      builder: (context, state) {
        if (state is AddressRegionLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AddressRegionSuccessState) {
          return DropdownButtonFormField(
            validator: (val) {
              return validIfNull(value: val.toString(), context: context);
            },
            disabledHint: const Text("Region"),
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
                    hint.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: size!.width * 0.03),
                  ),
                  Icon(
                    Icons.star,
                    size: size!.width * 0.025,
                    color: Colors.red,
                    // color: ,
                  )
                ],
              ),
            ),
            isDense: true,
            value: null,
            items: BlocProvider.of<AddressRegionCubit>(context)
                .addressRegionDataEntityList!
                .map(
                  (e) => DropdownMenuItem(
                    onTap: () {
                      BlocProvider.of<AddressCubit>(context).region =
                          e.addressId;
                      print(
                          "--->${BlocProvider.of<AddressCubit>(context).region}");
                    },
                    value: e.region,
                    child: Text(
                      e.region.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (c) {
              // region = c;
              // if (kDebugMode) {
              //   print(c);
              // }
            },
            iconSize: size!.width * 0.06,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            // hint: Row(
            //   children: [
            //     Text(
            //       hint,
            //       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //           decoration: TextDecoration.underline,
            //           fontSize: size.width * 0.025),
            //     ),
            //     Icon(
            //       Icons.star,
            //       size: size.width * 0.025,
            //       color: Colors.red,
            //       // color: ,
            //     )
            //   ],
            // ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
