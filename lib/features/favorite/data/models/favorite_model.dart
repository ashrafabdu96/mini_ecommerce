import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    super.status,
    super.favoriteDataEntity,
  });
  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      favoriteDataEntity = <FavoriteDataEntity>[];
      json['data'].forEach((v) {
        favoriteDataEntity!.add(FavoriteDataModel.fromJson(v));
      });
    }
  }
}

class FavoriteDataModel extends FavoriteDataEntity {
  FavoriteDataModel(
      {super.status,
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
  factory FavoriteDataModel.fromJson(Map<String, dynamic> json) {
    return FavoriteDataModel(
      status: json['status'],
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
