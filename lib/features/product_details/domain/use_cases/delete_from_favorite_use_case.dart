import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_detail_operation_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/repositories/base_item_detail_repository.dart';

class DeleteFromFavoriteUseCase {
  final BaseItemDetailsRepository baseItemDetailsRepository;
  DeleteFromFavoriteUseCase({required this.baseItemDetailsRepository});

  Future<Either<Failure, ItemDetailOperationEntity>> call(
      int userId, int itemId) async {
    return await baseItemDetailsRepository.deleteFromFavorite(userId, itemId);
  }
}
