import 'package:mini_ecommerce/features/product_details/domain/entities/item_detail_operation_entity.dart';

class ItemDetailOperationModel extends ItemDetailOperationEntity {
  ItemDetailOperationModel({
    required super.status,
    required super.message,
    super.itemCartId,
    super.usersCartId,
  }) {
    itemCartId ?? "none";
    usersCartId ?? "none";
  }

  factory ItemDetailOperationModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("data")) {
      return ItemDetailOperationModel(
          status: json["status"],
          message: json["message"],
          itemCartId: json["data"]["item_cart_id"],
          usersCartId: json["data"]["users_cart_id"]);
    } else {
      return ItemDetailOperationModel(
        status: json["status"],
        message: json["message"],
        // itemCartId: json["data"]["item_cart_id"].toString() ?? "none",
        // usersCartId: json["data"]["users_cart_id"].toString() ?? "none",
      );
    }
  }
}
