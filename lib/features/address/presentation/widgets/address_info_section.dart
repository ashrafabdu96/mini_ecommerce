import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/presentation/widgets/custom_address_information_texts.dart';

class AddressInfoSection extends StatelessWidget {
  const AddressInfoSection({
    Key? key,
    required this.size,
    required this.userAddressEntity,
  }) : super(key: key);

  final Size size;
  final UserAddressEntity userAddressEntity;

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
        child: CustomAddressInformationTexts(
          userAddress: userAddressEntity,
        ));
  }
}
