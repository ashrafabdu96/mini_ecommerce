import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';
import 'package:mini_ecommerce/features/user_profile/domain/repositories/base_profile_repository.dart';

class GetUserInfoUseCase {
  final BaseProfileRepository baseProfileRepository;

  GetUserInfoUseCase({required this.baseProfileRepository});
  Future<UserEntity> call() async {
    return await baseProfileRepository.getUserInformation();
  }
}
