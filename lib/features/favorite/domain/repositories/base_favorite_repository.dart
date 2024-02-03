import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_operation_entity.dart';

abstract class BaseFavoriteRepository {
  Future<Either<Failure, FavoriteEntity>> getFavoriteData(int userId);
  Future<Either<Failure, FavoriteOperationEntity>> deleteFromFavorite(
      int userId, int itemId);
  Future<Either<Failure, FavoriteOperationEntity>> addToCartFromFavorite(
      int userId, int itemId);
}
