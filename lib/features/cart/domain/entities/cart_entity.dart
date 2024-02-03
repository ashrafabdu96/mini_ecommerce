import 'package:equatable/equatable.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class CartEntity extends Equatable {
  CartEntity({this.status, this.cartDataEntity, this.total});
  String? status;
  List<CartDataEntity>? cartDataEntity;
  int? total;
  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        cartDataEntity,
      ];

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'productsByCatDataEntity': cartDataEntity,
    };
  }
}

class CartDataEntity extends BaseItemEntity with EquatableMixin {
  String? status;
  int? cartQuantity;
  CartDataEntity({
    this.status,
    this.cartQuantity,
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
    super.isInFav,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        itemsId,
        itemsName,
        itemsNameAr,
        itemsDescription,
        itemsDescriptionAr,
        itemsImage,
        itemsImage2,
        itemsImage3,
        itemsImage4,
        itemsDateCreate,
        itemsActive,
        itemsCount,
        itemsDiscount,
        itemsPrice,
        itemsCategoriesId,
        isInCart,
        isInFav
      ];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartQuantity'] = cartQuantity;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_description'] = itemsDescription;
    data['items_description_ar'] = itemsDescriptionAr;
    data['items_image'] = itemsImage;
    data['items_image2'] = itemsImage2;
    data['items_image3'] = itemsImage3;
    data['items_image4'] = itemsImage4;
    data['items_date_create'] = itemsDateCreate;
    data['items_count'] = itemsCount;
    data['items_discount'] = itemsDiscount;
    data['items_price'] = itemsPrice;
    data['items_categories_id'] = itemsCategoriesId;
    return data;
  }
}
