import 'package:flutter/material.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_entity.dart';
import 'package:mini_ecommerce/features/orders/presentation/widgets/order_card.dart';

class OrdersSection extends StatelessWidget {
  const OrdersSection({
    Key? key,
    required this.size,
    required this.headOrderEntity,
  }) : super(key: key);
  final HeadOrderEntity headOrderEntity;
  final Size size;
  //here will be the cubit
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.95,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ...List.generate(
            headOrderEntity.headOrderDataEntityList!.length,
            (index) => OrderCard(
              size: size,
              headOrderDataEntity:
                  headOrderEntity.headOrderDataEntityList![index],
            ),
          ),
          SizedBox(height: size.height * 0.3),
        ],
      ),
    );
  }
}
