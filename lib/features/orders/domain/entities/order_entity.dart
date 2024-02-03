class HeadOrderEntity {
  String? status;
  List<HeadOrderDataEntity>? headOrderDataEntityList;

  HeadOrderEntity({this.status, this.headOrderDataEntityList});
}

class HeadOrderDataEntity {
  int? orderId;
  int? userIdOrder;
  String? orderDate;
  int? shipId;
  int? isDelivered;
  int? total;

  HeadOrderDataEntity(
      {this.orderId,
      this.userIdOrder,
      this.orderDate,
      this.shipId,
      this.isDelivered,
      this.total});
}
