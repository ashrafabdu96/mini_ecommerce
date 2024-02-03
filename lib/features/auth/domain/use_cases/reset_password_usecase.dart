import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repositories/base_auth_repository.dart';

class ResetPasswordUseCase {
  final BaseAuthRepository baseAuthRepository;

  ResetPasswordUseCase({required this.baseAuthRepository});

  Future<Either<Failure, AuthEntity>> call(
          {required String email, required String password}) async =>
      await baseAuthRepository.resetPassword(email, password);
}
