import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mini_ecommerce/features/auth/data/models/auth_model.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repositories/base_auth_repository.dart';

class AuthRepositoryImp implements BaseAuthRepository {
  final AuthRemoteDataSourceImp authRemoteDataSourceImp;
  final NetworkInfo networkInfo;
  final AuthLocalDataSourceImp? authLocalDataSourceImp;
  AuthRepositoryImp(
      {this.authLocalDataSourceImp,
      required this.networkInfo,
      required this.authRemoteDataSourceImp});

  @override
  Future<Either<Failure, AuthEntity>> login(
      String userEmail, String userPassword) async {
    if ( await networkInfo.isConnected) {
      try {
        final AuthModel remoteData =
            await authRemoteDataSourceImp.login(userEmail, userPassword);
        if (remoteData.status == "success") {
          authLocalDataSourceImp!.cacheUser(remoteData);
          return Right(remoteData);
        } else if (remoteData.status == "not Approved") {
          return Left(NotAcceptableAccountFailure());
        } else if (remoteData.status == "fail") {
          return Left(NotFoundFailure());
        } else if (remoteData.status == "Invalid email or Password") {
          return Left(EmailFailure());
        } else {
          return Left(PasswordFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
      //todo
      // get info from local
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signup(String userEmail,
      String userPassword, String userName, String phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await authRemoteDataSourceImp.signup(
            userEmail, userPassword, userName, phoneNumber);
        if (remoteData.status == "success") {
          return Right(remoteData);
        } else {
          return Left(EmailExistFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> verifyCode(
      String email, String verifyCode) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData =
            await authRemoteDataSourceImp.verifyCode(email, verifyCode);
        if (remoteData.status == "success") {
          print("remoteData==>> $remoteData");
          return Right(remoteData);
        } else if (remoteData.status == "used_before") {
          return Left(VerificationCodeUsedBeforeFailure());
        } else {
          return Left(VerificationCodeFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  ///Forget Password

  @override
  Future<Either<Failure, AuthModel>> forgetPasswordCheckEmail(
      String userEmail) async {
    if (await networkInfo.isConnected) {
      try {
        final AuthModel remoteData =
            await authRemoteDataSourceImp.forgetPasswordCheckEmail(userEmail);
        if (remoteData.status == "success") {
          return Right(remoteData);
        } else {
          return Left(NotFoundFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AuthModel>> resetPassword(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData =
            await authRemoteDataSourceImp.resetPassword(email, password);
        if (remoteData.status == "success") {
          return Right(remoteData);
        } else {
          return Left(PasswordFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> verifyCodeForgetPassword(
      String email, String verifyCode) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await authRemoteDataSourceImp
            .verifyCodeForgetPassword(email, verifyCode);
        if (remoteData.status == "success") {
          print("remoteData==>> $remoteData");
          return Right(remoteData);
        } else {
          return Left(VerificationCodeFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> changePassword(
      {required String email,
      required String oldPassword,
      required String newPassword}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await authRemoteDataSourceImp.changePassword(
          email: email,
          oldPassword: oldPassword,
          newPassword: newPassword,
        );
        if (remoteData.status == "success") {
          return Right(remoteData);
        } else if (remoteData.status == "old password is Error") {
          return Left(OldPasswordFailure());
        } else {
          return Left(PasswordFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
