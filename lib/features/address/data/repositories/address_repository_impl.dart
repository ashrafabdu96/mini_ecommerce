import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/address/data/data_sources/address_remote_data_source.dart';
import 'package:mini_ecommerce/features/address/data/models/address_region_model.dart';
import 'package:mini_ecommerce/features/address/data/models/city_model.dart';
import 'package:mini_ecommerce/features/address/data/models/user_address_model.dart';
import 'package:mini_ecommerce/features/address/domain/entities/address_region_entity.dart';
import 'package:mini_ecommerce/features/address/domain/entities/city_entity.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/domain/repositories/base_address_repository.dart';

class AddressRepositoryImpl extends BaseAddressRepository {
  final AddressRemoteDataSourceImpl addressRemoteDataSourceImpl;
  final NetworkInfoImpl networkInfo;

  AddressRepositoryImpl(
      {required this.networkInfo, required this.addressRemoteDataSourceImpl});
  @override
  Future<Either<Failure, RegionEntity>> getAddressRegionInfo(int cityId) async {
    if (await networkInfo.isConnected) {
      try {
        final AddressRegionModel addressRegionModel =
            await addressRemoteDataSourceImpl.getRegionInfo(cityId);
        if (addressRegionModel.status == "success") {
          return Right(addressRegionModel);
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
  Future<Either<Failure, CityEntity>> getCityInfo() async {
    if (await networkInfo.isConnected) {
      try {
        final CityModel cityModel =
            await addressRemoteDataSourceImpl.getCityInfo();
        if (cityModel.status == "success") {
          return Right(cityModel);
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
  Future<Either<Failure, UserAddressEntity>> getUserAddress(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final UserAddressModel userAddressModel =
            await addressRemoteDataSourceImpl.getUserAddress(userId);
        if (userAddressModel.status == "success") {
          print('==========>success');
          return Right(userAddressModel);
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
  Future<Either<Failure, Unit>> addUserAddress(
      {required UserAddressEntity userAddressEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await addressRemoteDataSourceImpl.addUserAddress(
            userAddressEntity: userAddressEntity);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserAddress(
      {required UserAddressEntity userAddressEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await addressRemoteDataSourceImpl.updateUserAddress(
            userAddressEntity: userAddressEntity);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
