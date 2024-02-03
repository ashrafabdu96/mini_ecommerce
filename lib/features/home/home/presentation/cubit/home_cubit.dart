import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/home/home/domain/use_cases/get_data_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetDataUseCase getDataUseCase;
  List<AllItemsEntity> itemList = [];
  HomeCubit({required this.getDataUseCase}) : super(HomeInitialState());
  getData(BuildContext context, String userId) async {
    emit(HomeLoadingState());

    try {
      var result = await getDataUseCase(userId);

      // print("cubit $result");

      emit(_mapFailureOrHomeEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrHomeEntityToState(Left(ServerFailure()), context));
    }
  }

  refresh() {
    emit(HomeInitialState());
  }

  ///***helpers
  HomeState _mapFailureOrHomeEntityToState(
      Either<Failure, HomeEntity> either, BuildContext context) {
    return either.fold(
      (failure) => HomeErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (homeEntity) {
        itemList = homeEntity.allItems!;
        return HomeSuccessState(
            homeEntity: homeEntity, allItems: homeEntity.allItems);
      },
    );
  }

  List<AllItemsEntity>? searchProduct(
      {String? query, List<AllItemsEntity>? allItems}) {
    return allItems!
        .where((element) =>
            element.itemsName!.toLowerCase().contains(query!.toLowerCase()))
        .toList();
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
