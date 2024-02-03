import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';
import 'package:mini_ecommerce/features/user_profile/domain/repositories/base_profile_repository.dart';

class GetUserImageUseCase {
  final BaseProfileRepository baseProfileRepository;

  GetUserImageUseCase({required this.baseProfileRepository});
  Future<Either<Failure, UserEntity>> call({required int userId}) async {
    return await baseProfileRepository.getUserImage(userId: userId);
  }
}
