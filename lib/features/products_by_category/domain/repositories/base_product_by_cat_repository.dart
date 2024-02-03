import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/entities/product_by_cat_entity.dart';

abstract class BaseProductByCatRepository {
  Future<Either<Failure, ProductByCatEntity>> getDataByCategory(
      int userId, int categoryId);
}
