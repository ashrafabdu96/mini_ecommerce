import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/add_or_update_review_usecase.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/check_before_rate_usecase.dart';
import 'package:mini_ecommerce/injection_container.dart';

part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit(
      {required this.addOrUpdateReviewUseCase,
      required this.checkBeforeRateUseCase})
      : super(RateInitialState());
  final CheckBeforeRateUseCase checkBeforeRateUseCase;
  final AddOrUpdateReviewUseCase addOrUpdateReviewUseCase;
  final TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  checkBeforeRate({required int itemId}) async {
    try {
      final result = await checkBeforeRateUseCase(
        userId: int.parse(getUserId().toString()),
        itemId: itemId,
      );
      emit(_mapFailureOrUnitRateToState(result));
    } catch (e) {
      emit(state);
    }
  }

  addOrUpdateReview({required int itemId, int? stars}) async {
    try {
      emit(RateAddingOrUpdatingLoadingState());
      final result = await addOrUpdateReviewUseCase(
        itemId: itemId,
        userId: int.parse(getUserId().toString()),
        stars: stars,
        content: contentController.text,
      );

      emit(_mapFailureOrRateMapToState(result));
    } catch (e) {
      emit(state);
    }
  }

  ///***helpers
  RateState _mapFailureOrUnitRateToState(Either<Failure, Unit> either) {
    return either.fold(
      (failure) => RateNotBoughtState(),
      (unit) => RateBoughtState(),
    );
  }

  RateState _mapFailureOrRateMapToState(
      Either<Failure, Map<String, dynamic>> either) {
    return either.fold(
      (failure) => RateAddingOrUpdatingFailureState(),
      (rateMapResult) {
        if (rateMapResult['message'] == "review updated" ||
            rateMapResult['message'] == "review inserted") {
          return RateAddingOrUpdatingSuccessState(result: rateMapResult);
        } else {
          return RateAddingOrUpdatingNothingChangeState();
        }
      },
    );
  }
}
