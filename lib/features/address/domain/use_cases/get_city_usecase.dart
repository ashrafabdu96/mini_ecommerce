import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/address/domain/entities/city_entity.dart';
import 'package:mini_ecommerce/features/address/domain/repositories/base_address_repository.dart';

class GetCityUseCase {
  final BaseAddressRepository baseAddressRepository;

  GetCityUseCase({required this.baseAddressRepository});
  Future<Either<Failure, CityEntity>> call() async {
    return await baseAddressRepository.getCityInfo();
  }
}
