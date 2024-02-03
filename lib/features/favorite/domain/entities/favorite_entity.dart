import 'package:equatable/equatable.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class FavoriteEntity extends Equatable {
  FavoriteEntity({
    this.status,
    this.favoriteDataEntity,
  });
  String? status;
  List<FavoriteDataEntity>? favoriteDataEntity;

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        favoriteDataEntity,
      ];

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'productsByCatDataEntity': favoriteDataEntity,
    };
  }
}

class FavoriteDataEntity extends BaseItemEntity with EquatableMixin {
  String? status;
  FavoriteDataEntity({
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
