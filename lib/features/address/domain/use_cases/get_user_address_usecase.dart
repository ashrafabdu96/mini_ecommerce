import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/domain/repositories/base_address_repository.dart';

class GetUserAddressUseCase {
  final BaseAddressRepository baseAddressRepository;

  GetUserAddressUseCase({required this.baseAddressRepository});
  Future<Either<Failure, UserAddressEntity>> call(int userId) async {
    return await baseAddressRepository.getUserAddress(userId);
  }
}
