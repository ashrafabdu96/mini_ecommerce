part of 'chang_image_cubit.dart';

abstract class ChangImageState {}

class ChangImageInitialState extends ChangImageState {}

class ChangImageLoading extends ChangImageState {}

class ChangImageSuccessState extends ChangImageState {
  final UserEntity userEntity;
  ChangImageSuccessState({required this.userEntity});
}

class ChangImageFailureState extends ChangImageState {}
