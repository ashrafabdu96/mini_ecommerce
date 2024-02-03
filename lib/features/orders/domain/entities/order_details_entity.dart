class OrderDetailsEntity {
  String? status;
  List<OrderDetailDataEntity>? orderDetailDataEntity;

  OrderDetailsEntity({this.status, this.orderDetailDataEntity});
}

class OrderDetailDataEntity {
  int? itemIdOrder;
  String? itemNameOrder;
  int? orderId;
  int? quantity;
  int? discount;
  int? untiPrice;
  num? totalPrice;
  String? itemsImage;

  OrderDetailDataEntity(
      {this.itemIdOrder,
      this.itemNameOrder,
      this.orderId,
      this.quantity,
      this.discount,
      this.untiPrice,
      this.totalPrice,
      this.itemsImage});
}
