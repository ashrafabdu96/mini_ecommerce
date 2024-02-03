import 'package:equatable/equatable.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class ItemDetailEntity extends BaseItemEntity with EquatableMixin {
  ItemDetailEntity(
      {this.rateStars,
      this.publicRate,
      required this.status,
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
      super.isInFav}) {
    itemsId ?? 0;
    itemsName ?? "none";
    itemsName ?? "none";
    itemsDescription ?? "none";
    itemsDescriptionAr ?? "none";
    itemsImage ?? "none";
    itemsImage2 ?? "none";
    itemsImage3 ?? "none";
    itemsImage4 ?? "none";
    itemsDateCreate ?? "none";
    itemsActive ?? "none";
    itemsCount ?? "none";
    itemsDiscount ?? 0;
    itemsPrice ?? 0;
    itemsCategoriesId ?? 0;
    isInCart ?? "none";
    isInFav ?? "none";
  }
  final String? status;
  final int? rateStars;
  final double? publicRate;
  // final String? itemsName;
  // final String? itemsNameAr;
  // final String? itemsDescription;
  // final String? itemsDescriptionAr;
  // final String? itemsImage;
  // final String? itemsImage2;
  // final String? itemsImage3;
  // final String? itemsImage4;
  // final String? itemsDateCreate;
  // final int? itemsActive;
  // final int? itemsCount;
  // final int? itemsDiscount;
  // final int? itemsPrice;
  // final int? itemsCategoriesId;
  // final String? isInCart;
  // final String? isInFav;
  @override
  // TODO: implement props
  List<Object?> get props => [
        isInCart,
        itemsCategoriesId,
        itemsPrice,
        itemsDiscount,
        itemsCount,
        itemsActive,
        itemsDateCreate,
        itemsImage4,
        itemsImage3,
        itemsImage2,
        itemsImage,
        itemsDescriptionAr,
        itemsDescription,
        itemsNameAr,
        itemsName,
        itemsId,
        status,
        isInFav,
        rateStars,
        publicRate
      ];
}
