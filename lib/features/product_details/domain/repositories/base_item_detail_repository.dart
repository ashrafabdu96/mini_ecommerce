import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_detail_operation_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_details_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/reviews_entity.dart';

import '../entities/item_variation_entity.dart';

abstract class BaseItemDetailsRepository {
  Future<Either<Failure, ItemDetailEntity>> getData(int itemId);
  Future<Either<Failure, ItemDetailOperationEntity>> addToCart(
      String userId, String itemId);
  Future<Either<Failure, ItemDetailOperationEntity>> deleteFromCart(
      String userId, String itemId);
  Future<Either<Failure, ItemDetailOperationEntity>> addToFavorite(
      int userId, int itemId);
  Future<Either<Failure, ItemDetailOperationEntity>> deleteFromFavorite(
      int userId, int itemId);
  Future<Either<Failure, ItemVariationEntity>> getItemVariation(int itemId);
  Future<Either<Failure, Unit>> checkBeforeRate(
      {required int itemId, required int userId});
  Future<Either<Failure, Map<String, dynamic>>> addOrUpdateReview(
      {required int itemId, required int userId, String? content, int? stars});
  Future<Either<Failure, ReviewsEntity>> getItemReviews({required int itemId});
}
