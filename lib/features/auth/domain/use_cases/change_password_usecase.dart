import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repositories/base_auth_repository.dart';

class ChangePasswordUseCase {
  final BaseAuthRepository baseAuthRepository;

  ChangePasswordUseCase({required this.baseAuthRepository});

  Future<Either<Failure, AuthEntity>> call(
          {required String email,
          required String oldPassword,
          required String newPassword}) async =>
      await baseAuthRepository.changePassword(
          email: email, newPassword: newPassword, oldPassword: oldPassword);
}
