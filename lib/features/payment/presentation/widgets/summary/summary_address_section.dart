import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';

class SummaryAddressInfoSection extends StatelessWidget {
  const SummaryAddressInfoSection({
    Key? key,
    required this.size,
    required this.addressEntity,
  }) : super(key: key);

  final Size size;
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.01,
      ),
      height: size.height * 0.2,
      width: size.width * 0.98,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.02),
        color: AppColors.white,
        border: Border.all(color: AppColors.kShapesColor),
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            getAddressInfoList(context).length,
            (index) => Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              getAddressInfoList(context)[index],
              style: TextStyle(
                color: AppColors.kShapesColor,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.03,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> getAddressInfoList(BuildContext context) {
    return [
      "${"full_name".tr(context)}: ${addressEntity.firstName}' '${addressEntity.secondName} '' ${addressEntity.lastName}",
      "${"city_name".tr(context)}: ${addressEntity.cityName}",
      "${"region".tr(context)}: ${addressEntity.region}",
      "${"street_name".tr(context)}: ${addressEntity.streetName}",
      "${"neighborhood".tr(context)}: ${addressEntity.neighborhood}",
      "${"nearest_place".tr(context)}: ${addressEntity.nearestPlace}"
    ];
  }
}
