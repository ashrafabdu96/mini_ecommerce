import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/home/home/data/data_sources/home_remote_data_source.dart';
import 'package:mini_ecommerce/features/home/home/data/models/home_model.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/CategoryItemsEntity.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/home/home/domain/repositories/base_home_repository.dart';

class HomeRepositoryImpl extends BaseHomeRepository {
  final HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.homeRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, HomeEntity>> getData(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final HomeModel remoteData =
            await homeRemoteDataSourceImpl.getData(userId);
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

  @override
  Future<Either<Failure, CategoryItemsEntity>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final CategoryItemsEntity remoteData =
            await homeRemoteDataSourceImpl.getCategories();
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
