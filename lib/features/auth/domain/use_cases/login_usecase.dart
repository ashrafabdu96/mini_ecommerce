import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repositories/base_auth_repository.dart';

class LoginUseCase {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase({required this.baseAuthRepository});
  Future<Either<Failure, AuthEntity>> call(
      {required String userEmail, required String userPassword}) async {
    return await baseAuthRepository.login(userEmail, userPassword);
  }
}
