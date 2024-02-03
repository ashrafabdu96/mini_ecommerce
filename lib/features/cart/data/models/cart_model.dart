import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({super.status, super.cartDataEntity, super.total});
  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      cartDataEntity = <CartDataEntity>[];
      json['data'].forEach((v) {
        cartDataEntity!.add(CartDataModel.fromJson(v));
      });
    }
    total = json["total"];
  }
}

class CartDataModel extends CartDataEntity {
  CartDataModel(
      {super.status,
      super.cartQuantity,
      super.itemsId,
      super.itemsName,
      super.itemsNameAr,
      super.itemsDescription,
      super.itemsDescriptionAr,
      super.itemsImage,
      super.itemsImage2,
      super.itemsImage3,
      super.itemsImage4,
      super.itemsDateCreate,
      super.itemsActive,
      super.itemsCount,
      super.itemsDiscount,
      super.itemsPrice,
      super.itemsCategoriesId,
      super.isInCart,
      super.isInFav});
  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(
      status: json['status'],
      cartQuantity: json['cartQuantity'],
      itemsId: json['items_id'],
      itemsName: json["items_name"],
      itemsNameAr: json['items_name_ar'],
      itemsDescription: json['items_description'],
      itemsDescriptionAr: json['items_description_ar'],
      itemsImage: json['items_image'],
      itemsImage2: json['items_image2'] ?? "none",
      itemsImage3: json['items_image3'] ?? "none",
      itemsImage4: json['items_image4'] ?? "none",
      itemsDateCreate: json['items_date_create'],
      itemsActive: json['items_active'],
      itemsCount: json['items_count'],
      itemsDiscount: json['items_discount'],
      itemsPrice: json['items_price'],
      itemsCategoriesId: json['items_categories_id'],
      isInCart: json['isInCart'],
      isInFav: json["isInFav"],
    );
  }
}
