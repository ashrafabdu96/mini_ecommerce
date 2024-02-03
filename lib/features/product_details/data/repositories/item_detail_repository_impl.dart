import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/product_details/data/data_sources/item_d_remote_data_source.dart';
import 'package:mini_ecommerce/features/product_details/data/models/item_detail_model.dart';
import 'package:mini_ecommerce/features/product_details/data/models/item_operation_model.dart';
import 'package:mini_ecommerce/features/product_details/data/models/item_variation_model.dart';
import 'package:mini_ecommerce/features/product_details/data/models/reviews_model.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_detail_operation_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_details_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_variation_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/reviews_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/repositories/base_item_detail_repository.dart';

class ItemDetailRepositoryImp extends BaseItemDetailsRepository {
  final ItemDetailRemoteDataSourceImpl itemDetailRemoteDataSourceImpl;
  final NetworkInfo networkInfo;

  ItemDetailRepositoryImp(
      {required this.networkInfo,
      required this.itemDetailRemoteDataSourceImpl});

  @override
  Future<Either<Failure, ItemDetailEntity>> getData(int itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final ItemDetailModel remoteData =
            await itemDetailRemoteDataSourceImpl.getItemDetailData(itemId);
        // print("================\n repoData==> success->$remoteData");

        if (remoteData.status == "success") {
          // print("================\n repoData==> success->$remoteData");
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
  Future<Either<Failure, ItemDetailOperationEntity>> addToCart(
      String userId, String itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final ItemDetailOperationModel remoteData =
            await itemDetailRemoteDataSourceImpl.addToCart(userId, itemId);
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
  Future<Either<Failure, ItemDetailOperationEntity>> addToFavorite(
      int userId, int itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final ItemDetailOperationModel remoteData =
            await itemDetailRemoteDataSourceImpl.addToFavorite(userId, itemId);
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
  Future<Either<Failure, ItemDetailOperationEntity>> deleteFromCart(
      String userId, String itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final ItemDetailOperationModel remoteData =
            await itemDetailRemoteDataSourceImpl.deleteFromCart(userId, itemId);
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
  Future<Either<Failure, ItemDetailOperationEntity>> deleteFromFavorite(
      int userId, int itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final ItemDetailOperationModel remoteData =
            await itemDetailRemoteDataSourceImpl.deleteFromFavorite(
                userId, itemId);
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
  Future<Either<Failure, ItemVariationEntity>> getItemVariation(itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final ItemVariationModel remoteData =
            await itemDetailRemoteDataSourceImpl.getItemVariation(itemId);
        // print("================\n repoData==> success->$remoteData");

        if (remoteData.status == "success") {
          // print("================\n repoData==> success->$remoteData");
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
  Future<Either<Failure, Unit>> checkBeforeRate(
      {required int itemId, required int userId}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await itemDetailRemoteDataSourceImpl.checkBeforeRate(
            itemId: itemId, userId: userId);
        // print("================\n repoData==> success->$remoteData");
        return const Right(unit);
      } catch (e) {
        if (e is NotFoundException) {
          return Left(NotFoundFailure());
        } else {
          return Left(ServerFailure());
        }
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addOrUpdateReview(
      {required int itemId,
      required int userId,
      String? content,
      int? stars}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData =
            await itemDetailRemoteDataSourceImpl.addOrUpdateReview(
                itemId: itemId, userId: userId, content: content, stars: stars);
        // print("================\n repoData==> success->$remoteData");
        return Right(remoteData);
      } catch (e) {
        if (e is NotFoundException) {
          return Left(NotFoundFailure());
        } else {
          return Left(ServerFailure());
        }
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ReviewsEntity>> getItemReviews(
      {required int itemId}) async {
    if (await networkInfo.isConnected) {
      try {
        final ReviewsModel remoteData =
            await itemDetailRemoteDataSourceImpl.getItemReviews(itemId: itemId);
        // print("================\n repoData==> success->$remoteData");

        if (remoteData.status == "success") {
          // print("================\n repoData==> success->$remoteData");
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
