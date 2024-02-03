import 'package:mini_ecommerce/features/cart/domain/entities/cart_operation_entity.dart';

class CartOperationModel extends CartOperationEntity {
  CartOperationModel({
    required super.status,
    required super.message,
    super.itemCartId,
    super.usersCartId,
  }) {
    itemCartId ?? "none";
    usersCartId ?? "none";
  }

  factory CartOperationModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("data")) {
      return CartOperationModel(
          status: json["status"],
          message: json["message"],
          itemCartId: json["data"]["item_cart_id"],
          usersCartId: json["data"]["users_cart_id"]);
    } else {
      return CartOperationModel(
        status: json["status"],
        message: json["message"],
        // itemCartId: json["data"]["item_cart_id"].toString() ?? "none",
        // usersCartId: json["data"]["users_cart_id"].toString() ?? "none",
      );
    }
  }
}
