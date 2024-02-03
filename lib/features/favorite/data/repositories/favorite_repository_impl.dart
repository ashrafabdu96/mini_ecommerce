import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/favorite/data/data_sources/remote_favorite_data_source.dart';
import 'package:mini_ecommerce/features/favorite/data/models/favorite_model.dart';
import 'package:mini_ecommerce/features/favorite/data/models/favorite_operation_model.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_operation_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/repositories/base_favorite_repository.dart';

class FavoriteRepositoryImpl extends BaseFavoriteRepository {
  final RemoteFavoriteDataSourceImpl remoteFavoriteDataSourceImpl;

  FavoriteRepositoryImpl(
      {required this.networkInfo, required this.remoteFavoriteDataSourceImpl});
  final NetworkInfoImpl networkInfo;

  @override
  Future<Either<Failure, FavoriteOperationEntity>> deleteFromFavorite(
      int userId, int itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final FavoriteOperationModel favoriteOperationModel =
            await remoteFavoriteDataSourceImpl.deleteFavorite(userId, itemId);
        if (favoriteOperationModel.status == "success") {
          return Right(favoriteOperationModel);
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
  Future<Either<Failure, FavoriteEntity>> getFavoriteData(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final FavoriteModel favoriteModel =
            await remoteFavoriteDataSourceImpl.getFavoriteData(userId);
        if (favoriteModel.status == "success") {
          return Right(favoriteModel);
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
  Future<Either<Failure, FavoriteOperationEntity>> addToCartFromFavorite(
      int userId, int itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final FavoriteOperationModel favoriteOperationModel =
            await remoteFavoriteDataSourceImpl.addToCartFromFavorite(
                userId, itemId);
        if (favoriteOperationModel.status == "success") {
          return Right(favoriteOperationModel);
        } else {
          return Left(AddFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
