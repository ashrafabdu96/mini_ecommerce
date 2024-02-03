import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/entities/product_by_cat_entity.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/repositories/base_product_by_cat_repository.dart';

class GetDataByCatUseCase {
  final BaseProductByCatRepository baseProductByCatRepository;

  GetDataByCatUseCase({required this.baseProductByCatRepository});

  Future<Either<Failure, ProductByCatEntity>> call(
      int userId, int categoryId) async {
    return await baseProductByCatRepository.getDataByCategory(
        userId, categoryId);
  }
}
