import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';

class SummaryOrderTableSection extends StatelessWidget {
  const SummaryOrderTableSection(
      {Key? key,
      required this.size,
      required this.cartDataEntityList,
      this.total})
      : super(key: key);
  final Size size;
  final List<CartDataEntity> cartDataEntityList;
  final int? total;
  @override
  Widget build(BuildContext context) {
    List<double> totalPrice = [];
    return DataTable(
        headingTextStyle: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(fontWeight: FontWeight.w700),
        dividerThickness: 2,
        border: TableBorder.all(),
        columns: [
          DataColumn(
            label: Text("Item Name".tr(context)),
          ),
          DataColumn(
            label: Text("Quantity".tr(context)),
          ),
          DataColumn(
            label: Text("Discount".tr(context)),
          ),
          DataColumn(
            label: Text("Price".tr(context)),
          ),
          DataColumn(
            label: Text("totalPrice".tr(context)),
          ),
        ],
        rows: [
          ...List.generate(
            cartDataEntityList.length,
            (index) {
              // cartDataEntityList[index]

              // total[index]=
              // ((cartDataEntityList[index].itemsPrice!.toInt() - (cartDataEntityList[index].itemsPrice!.toInt() * cartDataEntityList[index].itemsDiscount!.toInt() / 100)) * cartDataEntityList[index].cartQuantity!.toInt());
              totalPrice.add(((cartDataEntityList[index].itemsPrice!.toInt() -
                      (cartDataEntityList[index].itemsPrice!.toInt() *
                          cartDataEntityList[index].itemsDiscount!.toInt() /
                          100))) *
                  cartDataEntityList[index].cartQuantity!.toInt());
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
                DataCell(Text("${totalPrice[index]}"
                    // "${((cartDataEntityList[index].itemsPrice!.toInt() - (cartDataEntityList[index].itemsPrice!.toInt() * cartDataEntityList[index].itemsDiscount!.toInt() / 100)) * cartDataEntityList[index].cartQuantity!.toInt())}",
                    // "${cartDataEntityList[index].cartQuantity!.toInt() * cartDataEntityList[index].itemsPrice!.toInt()}",
                    )),
              ]);
            },
          ),
        ]);
  }
}
