part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final UserEntity userEntity;
  ProfileSuccessState({required this.userEntity});
}

class ProfileImageChangedState extends ProfileState {
  final UserEntity userEntity;
  ProfileImageChangedState({required this.userEntity});
}

class ProfileLoadingState extends ProfileState {}

class ProfileNoImageState extends ProfileState {}
