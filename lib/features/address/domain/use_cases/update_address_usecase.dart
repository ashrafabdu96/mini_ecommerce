import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/domain/repositories/base_address_repository.dart';

class UpdateUserAddressUseCase {
  final BaseAddressRepository baseAddressRepository;

  UpdateUserAddressUseCase({required this.baseAddressRepository});

  call({required UserAddressEntity userAddressEntity}) async {
    return await baseAddressRepository.updateUserAddress(
        userAddressEntity: userAddressEntity);
  }
}
