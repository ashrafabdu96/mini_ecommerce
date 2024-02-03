import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure, SearchItemEntity>> searchForProduct(
      {required String query});
  Future<Either<Failure, SearchItemEntity>> suggestion();
}
