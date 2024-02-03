import 'package:equatable/equatable.dart';

class SearchItemEntity {
  String? status;
  List<SearchItemDataEntity>? searchItemDataEntity;

  SearchItemEntity({this.status, this.searchItemDataEntity});
}

class SearchItemDataEntity extends Equatable {
  final int? itemsId;
  final String? itemsName;
  final String? itemsNameAr;
  final String? itemsDescription;
  final String? itemsDescriptionAr;
  final String? itemsImage;
  final int? itemsPrice;
  final int? itemsDiscount;

  const SearchItemDataEntity(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescription,
      this.itemsDescriptionAr,
      this.itemsImage,
      this.itemsPrice,
      this.itemsDiscount});

  @override
  // TODO: implement props
  List<Object?> get props => [
        itemsId,
        itemsName,
        itemsNameAr,
        itemsDescription,
        itemsDescriptionAr,
        itemsImage,
        itemsPrice,
        itemsDiscount
      ];
}
