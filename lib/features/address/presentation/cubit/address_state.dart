part of 'address_cubit.dart';

@immutable
abstract class AddressState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressAddedSuccessState extends AddressState {}

class AddressAddedFailState extends AddressState {}

class AddressAlreadyExistState extends AddressState {
  final UserAddressEntity userAddressEntity;

  AddressAlreadyExistState({required this.userAddressEntity});
}

class AddressNotExistState extends AddressState {
  final CityEntity cityEntity;
  final UserAddressEntity? userAddressEntity;

  AddressNotExistState({this.userAddressEntity, required this.cityEntity});
}

class AddressUpdateState extends AddressState {
  final UserAddressEntity? userAddressEntity;

  AddressUpdateState({required this.userAddressEntity});
}

class AddressErrorState extends AddressState {
  final String status;
  AddressErrorState({required this.status});
}

///*************************** AddressRegionState
@immutable
abstract class AddressRegionState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddressRegionInitialState extends AddressRegionState {}

class AddressRegionErrorState extends AddressRegionState {
  final String status;
  AddressRegionErrorState({required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

class AddressRegionLoadingState extends AddressRegionState {}

class AddressRegionSuccessState extends AddressRegionState {
  final RegionEntity addressRegionEntity;

  AddressRegionSuccessState({required this.addressRegionEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [addressRegionEntity];
}
