import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_variation_entity.dart';

import '../repositories/base_item_detail_repository.dart';

class GetItemVariationUseCase {
  final BaseItemDetailsRepository baseItemDetailsRepository;

  GetItemVariationUseCase({
    required this.baseItemDetailsRepository,
  });

  Future<Either<Failure, ItemVariationEntity>> call(int itemId) async {
    return await baseItemDetailsRepository.getItemVariation(itemId);
  }
}
