part of 'region_cubit.dart';

@immutable
abstract class RegionState {}

class RegionInitialState extends RegionState {}

class RegionErrorState extends RegionState {
  final String status;

  RegionErrorState({required this.status});
}

class RegionLoadingState extends RegionState {}

class RegionSuccessState extends RegionState {
  final RegionEntity regionEntity;
  RegionSuccessState({required this.regionEntity});
}
