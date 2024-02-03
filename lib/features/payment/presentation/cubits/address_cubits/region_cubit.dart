import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/region_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/get_region_usecase.dart';

part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  final GetRegionUseCase getRegionUseCase;
  RegionCubit({required this.getRegionUseCase}) : super(RegionLoadingState());
  int? regionId;
  getRegion(int cityId, BuildContext context) async {
    try {
      emit(RegionLoadingState());
      var result = await getRegionUseCase(cityId: cityId);
      print('from cubit -->>>$result');
      emit(_mapFailureOrRegionEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrRegionEntityToState(Left(ServerFailure()), context));
    }
  }

  ///helpers
  RegionState _mapFailureOrRegionEntityToState(
      Either<Failure, RegionEntity> either, BuildContext context) {
    return either.fold(
      (failure) {
        return RegionErrorState(status: _mapFailureToMessage(failure, context));
      },
      (entity) {
        return RegionSuccessState(regionEntity: entity);
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
