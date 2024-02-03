import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/address/domain/entities/city_entity.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';
import 'package:mini_ecommerce/features/address/domain/use_cases/add_address_usecase.dart';
import 'package:mini_ecommerce/features/address/domain/use_cases/get_address_region_usecase.dart';
import 'package:mini_ecommerce/features/address/domain/use_cases/get_city_usecase.dart';
import 'package:mini_ecommerce/features/address/domain/use_cases/get_user_address_usecase.dart';
import 'package:mini_ecommerce/features/address/domain/use_cases/update_address_usecase.dart';
import 'package:mini_ecommerce/injection_container.dart';

import '../../domain/entities/address_region_entity.dart';

part 'address_state.dart';

/// address Region when select the city it will get the region data
class AddressRegionCubit extends Cubit<AddressRegionState> {
  List<sRegionDataEntity>? addressRegionDataEntityList;
  AddressRegionCubit({required this.getAddressRegionUseCase})
      : super(AddressRegionInitialState());
  final GetAddressRegionUseCase getAddressRegionUseCase;
  getRegion(BuildContext context, int cityId) async {
    try {
      emit(AddressRegionLoadingState());
      var result = await getAddressRegionUseCase(cityId);
      emit(_mapFailureOrRegionAddressEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrRegionAddressEntityToState(
          Left(ServerFailure()), context));
    }
  }

  ///helpers
  AddressRegionState _mapFailureOrRegionAddressEntityToState(
      Either<Failure, RegionEntity> either, BuildContext context) {
    return either.fold(
      (failure) => AddressRegionErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (addressRegionEntity) {
        addressRegionDataEntityList =
            addressRegionEntity.addressRegionDataEntityList;
        return AddressRegionSuccessState(
            addressRegionEntity: addressRegionEntity);
      },
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "serverFailure".tr(context);
      case OfflineFailure:
        return "offlineFailure".tr(context);
      case NotFoundFailure:
        return "no_data_found".tr(context);
      default:
        return "unExpectedFailure".tr(context);
    }
  }
}

/// address Cubit for every thing accept RegionAddress
class AddressCubit extends Cubit<AddressState> {
  List<CityEntityData>? cityEntityDataList;
  UpdateUserAddressUseCase updateUserAddressUseCase;

  int? region;
  AddressCubit({
    required this.addUserAddressUseCase,
    required this.getCityUseCase,
    required this.getUserAddressUseCase,
    required this.updateUserAddressUseCase,
  }) : super(AddressInitialState());
  final GetUserAddressUseCase getUserAddressUseCase;
  final GetCityUseCase getCityUseCase;
  final AddUserAddressUseCase addUserAddressUseCase;

  addUserAddress(
      {required BuildContext context,
      required UserAddressEntity userAddressEntity}) async {
    try {
      final result =
          await addUserAddressUseCase(userAddressEntity: userAddressEntity);
      emit(_mapFailureOrUnitToState(result, context));
    } catch (e) {
      print(e.toString());
      // emit(_mapFailureOrUnitToState(, context));

    }
  }

  updateUserAddress({
    required UserAddressEntity userAddressEntity,
    required BuildContext context,
  }) async {
    try {
      final result =
          await updateUserAddressUseCase(userAddressEntity: userAddressEntity);
      emit(_mapFailureOrUnitToState(result, context));
    } catch (e) {
      print(e.toString());
      // emit(_mapFailureOrUnitToState(, context));

    }
  }

  updateAddressScreenToUpdateInfo(BuildContext context,
      {required UserAddressEntity userAddressEntity}) async {
    print(userAddressEntity.lastName);
    await getCityInfo(context);
    emit(AddressUpdateState(
      userAddressEntity: userAddressEntity,
    ));
  }

  getUserAddress(BuildContext context) async {
    try {
      emit(AddressLoadingState());
      var result = await getUserAddressUseCase(int.parse(getUserId()));
      print('from cubit -->>>$result');
      emit(_mapFailureOrUserAddressEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrUserAddressEntityToState(
          Left(ServerFailure()), context));
    }
  }

  getCityInfo(BuildContext context) async {
    try {
      emit(AddressLoadingState());
      final result = await getCityUseCase();
      // print(result);
      emit(_mapFailureOrUserAddressEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrUserAddressEntityToState(
          Left(ServerFailure()), context));
    }
  }

  AddressState _mapFailureOrUserAddressEntityToState(
      Either<Failure, dynamic> either, BuildContext context) {
    return either.fold(
      (failure) {
        return AddressErrorState(
            status: _mapFailureToMessage(failure, context));
      },
      (entity) {
        if (entity is CityEntity) {
          cityEntityDataList = entity.cityEntityDataList;
          print("cubit--cityList--> $cityEntityDataList");
          return AddressNotExistState(cityEntity: entity);
        } else {
          if (kDebugMode) {
            print(entity);
          }
          return AddressAlreadyExistState(userAddressEntity: entity);
        }
      },
    );
  }

  AddressState _mapFailureOrUnitToState(
      Either<Failure, Unit> either, BuildContext context) {
    return either.fold(
      (failure) {
        return AddressAddedFailState(
            // status: _mapFailureToMessage(failure, context),
            );
      },
      (unit) {
        return AddressAddedSuccessState();
      },
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "serverFailure".tr(context);
      case OfflineFailure:
        return "offlineFailure".tr(context);
      case NotFoundFailure:
        return "no_data_found".tr(context);
      default:
        return "unExpectedFailure".tr(context);
    }
  }
}
