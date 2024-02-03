import 'package:flutter/material.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';

class OrderTableSection extends StatelessWidget {
  const OrderTableSection(
      {Key? key, required this.size, required this.cartDataEntityList})
      : super(key: key);
  final Size size;
  final List<CartDataEntity> cartDataEntityList;
  @override
  Widget build(BuildContext context) {
    List<double> total = [];
    return DataTable(
        headingTextStyle: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(fontWeight: FontWeight.w700),
        dividerThickness: 2,
        border: TableBorder.all(),
        columns: const [
          DataColumn(
            label: Text("Item Name"),
          ),
          DataColumn(
            label: Text("Quantity"),
          ),
          DataColumn(
            label: Text("Discount"),
          ),
          DataColumn(
            label: Text("Price"),
          ),
          DataColumn(
            label: Text("totalPrice"),
          ),
        ],
        rows: [
          ...List.generate(
            cartDataEntityList.length,
            (index) {
              // cartDataEntityList[index]

              // total[index]=
              // ((cartDataEntityList[index].itemsPrice!.toInt() - (cartDataEntityList[index].itemsPrice!.toInt() * cartDataEntityList[index].itemsDiscount!.toInt() / 100)) * cartDataEntityList[index].cartQuantity!.toInt());
              total.add(((cartDataEntityList[index].itemsPrice!.toInt() -
                      (cartDataEntityList[index].itemsPrice!.toInt() *
                          cartDataEntityList[index].itemsDiscount!.toInt() /
                          100)) *
                  cartDataEntityList[index].cartQuantity!.toInt()));
              return DataRow(cells: [
                DataCell(Text(
                  cartDataEntityList[index].itemsName.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
                DataCell(
                    Text(cartDataEntityList[index].cartQuantity.toString())),
                DataCell(
                    Text(cartDataEntityList[index].itemsDiscount.toString())),
                DataCell(Text(cartDataEntityList[index].itemsPrice.toString())),
                DataCell(Text("${total[index]}"
                    // "${((cartDataEntityList[index].itemsPrice!.toInt() - (cartDataEntityList[index].itemsPrice!.toInt() * cartDataEntityList[index].itemsDiscount!.toInt() / 100)) * cartDataEntityList[index].cartQuantity!.toInt())}",
                    // "${cartDataEntityList[index].cartQuantity!.toInt() * cartDataEntityList[index].itemsPrice!.toInt()}",
                    )),
              ]);
            },
          ),
        ]);
  }
}
