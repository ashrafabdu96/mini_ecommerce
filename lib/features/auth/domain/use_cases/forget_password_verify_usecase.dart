import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repositories/base_auth_repository.dart';

class ForgetPasswordVerifyCodeUseCase {
  final BaseAuthRepository baseAuthRepository;

  ForgetPasswordVerifyCodeUseCase({required this.baseAuthRepository});
  Future<Either<Failure, AuthEntity>> call(
      String email, String verifyCode) async {
    return await baseAuthRepository.verifyCodeForgetPassword(email, verifyCode);
  }
}
