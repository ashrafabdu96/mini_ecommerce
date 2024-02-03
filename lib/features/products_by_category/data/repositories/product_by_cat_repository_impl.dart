import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/products_by_category/data/data_sources/remote_data_source.dart';
import 'package:mini_ecommerce/features/products_by_category/data/models/product_bay_cat_model.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/entities/product_by_cat_entity.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/repositories/base_product_by_cat_repository.dart';

class ProductByCatRepositoryImpl extends BaseProductByCatRepository {
  final ProductByCatRemoteDataSourceImpl productByCatRemoteDataSourceImpl;
  final NetworkInfo networkInfo;
  ProductByCatRepositoryImpl(
      {required this.networkInfo,
      required this.productByCatRemoteDataSourceImpl});

  @override
  Future<Either<Failure, ProductByCatEntity>> getDataByCategory(
      int userId, int categoryId) async {
    if (await networkInfo.isConnected) {
      try {
        final ProductByCatModel remoteData =
            await productByCatRemoteDataSourceImpl.getDataByCat(
                userId, categoryId);
        if (remoteData.status == "success") {
          return Right(remoteData);
        } else {
          return Left(NotFoundFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
