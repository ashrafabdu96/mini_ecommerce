import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:mini_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:mini_ecommerce/features/cart/data/models/cart_operation_model.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_operation_entity.dart';

import '../../domain/repositories/base_cart_repository.dart';

class CartRepositoryImpl extends BaseCartRepository {
  final CartRemoteDataSourceImpl cartRemoteDataSourceImpl;
  final NetworkInfoImpl networkInfo;
  CartRepositoryImpl({
    required this.cartRemoteDataSourceImpl,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, CartEntity>> getCartData(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final CartModel cartModel =
            await cartRemoteDataSourceImpl.getCartData(userId);
        if (cartModel.status == "success") {
          return Right(cartModel);
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
  Future<Either<Failure, CartOperationEntity>> deleteFromCart(
      String userId, String itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final CartOperationModel cartOperationModel =
            await cartRemoteDataSourceImpl.deleteFromCart(userId, itemId);
        if (cartOperationModel.status == "success") {
          return Right(cartOperationModel);
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
  Future<Either<Failure, CartOperationEntity>> updateCartItemQuantity(
      int quantity, int itemId) async {
    if (await networkInfo.isConnected) {
      try {
        final CartOperationModel cartOperationModel =
            await cartRemoteDataSourceImpl.updateCartItemQuantity(
          itemId: itemId,
          quantity: quantity,
        );
        if (cartOperationModel.status == "success") {
          return Right(cartOperationModel);
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
