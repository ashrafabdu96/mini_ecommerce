import 'package:equatable/equatable.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class ProductByCatEntity extends Equatable {
  ProductByCatEntity({
    this.status,
    this.productsByCatDataEntity,
  });
  String? status;
  List<ProductByCatDataEntity>? productsByCatDataEntity;

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        productsByCatDataEntity,
      ];

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'productsByCatDataEntity': productsByCatDataEntity,
    };
  }
}

class ProductByCatDataEntity extends BaseItemEntity with EquatableMixin {
  String? status;
  ProductByCatDataEntity({
    this.status,
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
}
