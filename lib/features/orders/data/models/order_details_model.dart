import 'package:mini_ecommerce/features/orders/domain/entities/order_details_entity.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  List<OrderDetailDataModel>? orderDetailDataModel;

  OrderDetailsModel({
    super.status,
    super.orderDetailDataEntity,
    this.orderDetailDataModel,
  }) {
    // super.orderDetailDataEntity = orderDetailDataModel;
  }
  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      orderDetailDataEntity = <OrderDetailDataModel>[];
      json['data'].forEach((v) {
        orderDetailDataEntity!.add(OrderDetailDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (orderDetailDataModel != null) {
      data['data'] = orderDetailDataModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetailDataModel extends OrderDetailDataEntity {
  OrderDetailDataModel({
    super.orderId,
    super.totalPrice,
    super.quantity,
    super.itemsImage,
    super.discount,
    super.itemIdOrder,
    super.itemNameOrder,
    super.untiPrice,
  });

  OrderDetailDataModel.fromJson(Map<String, dynamic> json) {
    itemIdOrder = json['item_id_order'];
    itemNameOrder = json['item_name_order'];
    orderId = json['order_id'];
    quantity = json['quantity'];
    discount = json['discount'];
    untiPrice = json['unti_price'];
    totalPrice = json['total_price'].runtimeType == int
        ? json['total_price'].toInt()
        : json['total_price'];
    itemsImage = json['items_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id_order'] = itemIdOrder;
    data['item_name_order'] = itemNameOrder;
    data['order_id'] = orderId;
    data['quantity'] = quantity;
    data['discount'] = discount;
    data['unti_price'] = untiPrice;
    data['total_price'] = totalPrice;
    data['items_image'] = itemsImage;
    return data;
  }
}
