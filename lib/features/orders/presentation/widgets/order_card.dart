import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_entity.dart';
import 'package:mini_ecommerce/features/orders/presentation/widgets/order_description.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.size,
    required this.headOrderDataEntity,
  }) : super(key: key);

  final Size size;
  final HeadOrderDataEntity headOrderDataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      decoration: BoxDecoration(
        // boxShadow: AppColors.containersShadow,
        color: AppColors.white,
        // border: BorderDirectional(
        //     bottom: BorderSide(color: AppColors.white)),
        borderRadius: BorderRadius.circular(
          size.width * 0.03,
        ),
      ),
      height: size.height * 0.2,
      width: size.width * 0.9,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            children: [
              OrderDescription(
                height: constraint.maxHeight,
                width: constraint.maxWidth,
                isWithButton: false,
                firstTitle:
                    "${"order_no".tr(context)} : ${headOrderDataEntity.orderId}",
                secondTitle: "${headOrderDataEntity.orderDate}",
              ),
              OrderDescription(
                height: constraint.maxHeight,
                width: constraint.maxWidth,
                // firstTitle: "${'quantity'.tr(context)} : 25",
                isWithButton: false,
                secondTitle:
                    '${'total_amount'.tr(context)} : ${headOrderDataEntity.total} \$',
              ),
              SizedBox(
                height: constraint.maxHeight * 0.2,
              ),
              // const Spacer(),
              OrderDescription(
                height: constraint.maxHeight,
                width: constraint.maxWidth,
                isWithButton: true,
                secondTitle: headOrderDataEntity.isDelivered == 0
                    ? '${'processing'.tr(context)}..'
                    : 'delivered'.tr(context),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutesName.orderDetailsScreen,
                    arguments: headOrderDataEntity.orderId,
                  );
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const OrderDetailsScreen()));
                  print("${headOrderDataEntity.orderId}");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
