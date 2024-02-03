import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class OfflineFailure extends Failure {}

class ServerFailure extends Failure {}

class PasswordFailure extends Failure {}

class OldPasswordFailure extends Failure {}

class EmailFailure extends Failure {}

class EmailExistFailure extends Failure {}

class NotFoundFailure extends Failure {}

class AddFailure extends Failure {}

class VerificationCodeFailure extends Failure {}

class VerificationCodeUsedBeforeFailure extends Failure {}

class NotAcceptableAccountFailure extends Failure {}

class UnAcceptableFailure extends Failure {}
