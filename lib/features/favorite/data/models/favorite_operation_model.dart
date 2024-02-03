import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_operation_entity.dart';

class FavoriteOperationModel extends FavoriteOperationEntity {
  FavoriteOperationModel({
    required super.status,
    required super.message,
    super.itemCartId,
    super.usersCartId,
  }) {
    itemCartId ?? "none";
    usersCartId ?? "none";
  }

  factory FavoriteOperationModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("data")) {
      return FavoriteOperationModel(
          status: json["status"],
          message: json["message"],
          itemCartId: json["data"]["item_cart_id"],
          usersCartId: json["data"]["users_cart_id"]);
    } else {
      return FavoriteOperationModel(
        status: json["status"],
        message: json["message"],
        // itemCartId: json["data"]["item_cart_id"].toString() ?? "none",
        // usersCartId: json["data"]["users_cart_id"].toString() ?? "none",
      );
    }
  }
}
