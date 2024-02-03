part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  final AuthEntity authEntity;

  ForgetPasswordSuccessState({required this.authEntity});
}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String status;
  ForgetPasswordErrorState({required this.status});
}
