import 'package:mini_ecommerce/features/orders/domain/entities/order_entity.dart';

class HeadOrderModel extends HeadOrderEntity {
  List<HeadOrderDataModel>? headOrderDataModelList;

  HeadOrderModel({
    super.status,
    super.headOrderDataEntityList,
    this.headOrderDataModelList,
  }) {
    headOrderDataModelList =
        headOrderDataEntityList!.cast<HeadOrderDataModel>();
  }

  HeadOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      headOrderDataEntityList = <HeadOrderDataModel>[];
      json['data'].forEach((v) {
        headOrderDataEntityList!.add(HeadOrderDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['status'] = status;
    if (headOrderDataModelList != null) {
      // List <HeadOrderDataModel> headOrderDataModelList=headOrderDataEntityList;
      map['data'] = headOrderDataModelList!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class HeadOrderDataModel extends HeadOrderDataEntity {
  HeadOrderDataModel(
      {super.total,
      super.isDelivered,
      super.orderDate,
      super.orderId,
      super.shipId,
      super.userIdOrder});

  HeadOrderDataModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userIdOrder = json['user_id_order'];
    orderDate = json['order_date'];
    shipId = json['ship_id'];
    isDelivered = json['is_delivered'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['user_id_order'] = userIdOrder;
    data['order_date'] = orderDate;
    data['ship_id'] = shipId;
    data['is_delivered'] = isDelivered;
    data['total'] = total;
    return data;
  }
}
