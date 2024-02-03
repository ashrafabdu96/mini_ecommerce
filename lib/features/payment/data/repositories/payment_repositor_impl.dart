import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:mini_ecommerce/features/payment/data/models/address_model.dart';
import 'package:mini_ecommerce/features/payment/data/models/region_model.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/region_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/payment_entities/payment_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/repositories/base_payment_repository.dart';

class PaymentRepositoryImpl extends BasePaymentRepository {
  final PaymentRemoteDataSourceImpl paymentRemoteDataSourceImpl;
  final NetworkInfoImpl networkInfo;

  PaymentRepositoryImpl(
      {required this.networkInfo, required this.paymentRemoteDataSourceImpl});
  @override
  Future<Either<Failure, AddressEntity>> getAddress(
      {required int userId}) async {
    if (await networkInfo.isConnected) {
      try {
        final AddressModel addressModel =
            await paymentRemoteDataSourceImpl.getAddress(userId);
        if (addressModel.status == "success") {
          print('==========>success');
          return Right(addressModel);
        } else {
          print('==========>ffffoooooo');
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
  Future<Either<Failure, RegionEntity>> getRegion({required int cityId}) async {
    if (await networkInfo.isConnected) {
      try {
        final RegionModel regionModel =
            await paymentRemoteDataSourceImpl.getRegion(cityId);
        if (regionModel.status == "success") {
          print('==========>success');
          return Right(regionModel);
        } else {
          print('==========>ffffoooooo');
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
  Future<Either<Failure, Unit>> addAddress(
      {required AddressEntity addressEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await paymentRemoteDataSourceImpl.addAddress(
            addressEntity: addressEntity);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAddress(
      {required AddressEntity addressEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await paymentRemoteDataSourceImpl.updateAddress(
            addressEntity: addressEntity);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addPaymentInfo(
      {required PaymentEntity paymentEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await paymentRemoteDataSourceImpl.addPaymentInfo(
            paymentEntity: paymentEntity);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addAllOrderItems({
    required int userId,
    required double total,
    // required Map<String?, dynamic> orderJson,
    required List<CartDataEntity> cartDataEntityList,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await paymentRemoteDataSourceImpl.addPaymentOrder(
            userId: userId,
            total: total,
            cartDataEntityList: cartDataEntityList);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
