import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/presentation/screen/payment_screen.dart';
import 'package:mini_ecommerce/features/payment/presentation/widgets/summary/summary_order_table_section.dart';
import 'package:mini_ecommerce/injection_container.dart';

import 'summary_address_section.dart';

class Summary extends StatelessWidget {
  const Summary(
      {Key? key,
      this.addressEntity,
      required this.cartDataEntityList,
      this.total})
      : super(key: key);
  final AddressEntity? addressEntity;
  final List<BaseItemEntity> cartDataEntityList;
  // final List<CartDataEntity> cartDataEntityList;
  final int? total;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SummaryAddressInfoSection(
          size: size,
          addressEntity: addressEntity ??
              AddressEntity(
                  phoneNumber: '',
                  cityName: '',
                  neighborhood: '',
                  nearestPlace: '',
                  streetName: '',
                  firstName: '',
                  secondName: '',
                  lastName: '',
                  region: ''),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        // total and continue button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${"total_amount".tr(context)} : $total \$",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: size.width * 0.035,
                  color: AppColors.kShapesColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                      side: BorderSide(
                        color: Colors.white10.withOpacity(
                          0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  PaymentScreen.currentIndex.value = 0;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutesName.homeScreen,
                    (route) => false,
                    arguments: getUserId(),
                  );

                  // Navigator.popAndPushNamed(context, AppRoutesName.homeScreen,
                  //     arguments: getUserId());
                  // PaymentRemoteDataSourceImpl ob =
                  //     PaymentRemoteDataSourceImpl();
                  // await ob.addPaymentOrder(
                  //   userId: int.parse(getUserId()),
                  //   total: total!.toDouble(),
                  //   cartDataEntityList: cartDataEntityList,
                  // );
                },
                child: Text(
                  "Continue".tr(context),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: SummaryOrderTableSection(
            size: size,
            cartDataEntityList: cartDataEntityList as List<CartDataEntity>,
            total: total,
          ),
        )
      ],
    );
  }
}
