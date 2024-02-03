import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repositories/base_auth_repository.dart';

class SignupUseCase {
  final BaseAuthRepository baseAuthRepository;

  SignupUseCase({required this.baseAuthRepository});

  Future<Either<Failure, AuthEntity>> call(
      {required String userEmail,
      required String userPassword,
      required String userName,
      required String phoneNumber}) async {
    return await baseAuthRepository.signup(
        userEmail, userPassword, userName, phoneNumber);
  }
}
