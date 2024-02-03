import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_operation_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/repositories/base_favorite_repository.dart';

class DeleteFavUseCase {
  final BaseFavoriteRepository baseFavoriteRepository;

  DeleteFavUseCase({required this.baseFavoriteRepository});
  Future<Either<Failure, FavoriteOperationEntity>> call(
      int userId, int itemId) async {
    return await baseFavoriteRepository.deleteFromFavorite(userId, itemId);
  }
}
