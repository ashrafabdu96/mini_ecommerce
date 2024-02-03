import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/address/domain/entities/address_region_entity.dart';
import 'package:mini_ecommerce/features/address/domain/entities/city_entity.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';

abstract class BaseAddressRepository {
  Future<Either<Failure, UserAddressEntity>> getUserAddress(int userId);
  Future<Either<Failure, CityEntity>> getCityInfo();
  Future<Either<Failure, RegionEntity>> getAddressRegionInfo(int cityId);
  Future<Either<Failure, Unit>> addUserAddress(
      {required UserAddressEntity userAddressEntity});
  Future<Either<Failure, Unit>> updateUserAddress(
      {required UserAddressEntity userAddressEntity});
}
