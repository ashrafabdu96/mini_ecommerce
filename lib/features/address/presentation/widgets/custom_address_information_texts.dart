import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/presentation/cubit/address_cubit.dart';

class CustomAddressInformationTexts extends StatelessWidget {
  const CustomAddressInformationTexts({
    Key? key,
    this.userAddress,
  }) : super(key: key);
  final UserAddressEntity? userAddress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          getAddressInfoList(context).length,
          (index) => index == 0
              ? Row(
                  children: [
                    Expanded(
                      child: Text(
                        getAddressInfoList(context)[index].toString(),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AddressInformation(
                        //       size: size,
                        //       isUpdate: true,
                        //       userAddressEntity: userAddress,
                        //     ),
                        //   ),
                        // );
                        BlocProvider.of<AddressCubit>(context)
                            .updateAddressScreenToUpdateInfo(context,
                                userAddressEntity: userAddress!);
                      },
                      child: const Icon(
                        Icons.edit_location_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              : Text(
                  getAddressInfoList(context)[index].toString(),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
        ),
      ],
    );
  }

  List<String> getAddressInfoList(BuildContext context) {
    return [
      "${"full_name".tr(context)}: ${userAddress!.firstName}' '${userAddress!.secondName} '' ${userAddress!.lastName}",
      "${"city_name".tr(context)}: ${userAddress!.cityName}",
      "${"region".tr(context)}: ${userAddress!.region}",
      "${"street_name".tr(context)}: ${userAddress!.streetName}",
      "${"neighborhood".tr(context)}: ${userAddress!.neighborhood}",
      "${"nearest_place".tr(context)}: ${userAddress!.nearestPlace}"
    ];
  }
}
