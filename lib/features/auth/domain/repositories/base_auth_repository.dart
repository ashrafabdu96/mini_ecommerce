import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, AuthEntity>> login(
      String userEmail, String userPassword);

  Future<Either<Failure, AuthEntity>> signup(String userEmail,
      String userPassword, String userName, String phoneNumber);

  Future<Either<Failure, AuthEntity>> forgetPasswordCheckEmail(
      String userEmail);

  Future<Either<Failure, AuthEntity>> verifyCode(
      String email, String verifyCode);
  Future<Either<Failure, AuthEntity>> resetPassword(
      String email, String password);
  Future<Either<Failure, AuthEntity>> changePassword(
      {required String email,
      required String oldPassword,
      required String newPassword});
  Future<Either<Failure, AuthEntity>> verifyCodeForgetPassword(
      String email, String verifyCode);
}
