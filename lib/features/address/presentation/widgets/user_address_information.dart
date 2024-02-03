import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/presentation/widgets/address_info_section.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';

class UserAddressInformationWidget extends StatelessWidget {
  const UserAddressInformationWidget(
      {Key? key,
      required this.userAddressEntity,
      required this.cartDataEntityList})
      : super(key: key);
  final UserAddressEntity userAddressEntity;
  final List<CartDataEntity> cartDataEntityList;
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var i in cartDataEntityList) {
      total = total + (i.itemsPrice!.toInt() * i.cartQuantity!.toInt());
    }
    final Size size = MediaQuery.of(context).size;
    return Scrollbar(
      radius: Radius.circular(size.width * 0.02),
      thickness: size.width * 0.02,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(size.width * 0.025),
        children: [
          Text(
            "Location Information",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.kShapesColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          AddressInfoSection(
            size: size,
            userAddressEntity: userAddressEntity,
          ),
          const Divider(),
          // Text(
          //   "Order Details",
          //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
          //         color: AppColors.kShapesColor,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   physics: const BouncingScrollPhysics(),
          //   child: OrderTableSection(
          //     size: size,
          //     cartDataEntityList: cartDataEntityList,
          //   ),
          // ),
          // CartSummation(
          //   total: total.toString(),
          //   onTap: () {},
          //   size: size,
          // )
          // SizedBox(
          //   height: size.height * 0.15,
          // ),
          SizedBox(
            height: size.height * 0.05,
            width: size.width * 0.5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("confirm_orders".tr(context),
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
