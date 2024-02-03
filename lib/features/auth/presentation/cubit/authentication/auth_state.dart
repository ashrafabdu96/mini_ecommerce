part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String status;

  AuthErrorState({required this.status});
}

class AuthSuccessState extends AuthState {
  final AuthEntity authEntity;

  AuthSuccessState({required this.authEntity});
}
