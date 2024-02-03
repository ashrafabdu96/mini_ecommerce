import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/reviews_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/get_item_reviews_usecase.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit({required this.getItemReviewsUseCase})
      : super(ReviewsInitialState());
  final GetItemReviewsUseCase getItemReviewsUseCase;

  getItemReviews({required int itemId, required BuildContext context}) {
    emit(ReviewsLoadingState());
    getItemReviewsUseCase(itemId: itemId)
        .then(
      (value) => emit(
        _mapFailureOrReviewsEntityToState(value, context),
      ),
    )
        .catchError((e) {
      emit(state);
    });
  }

  ///helpers

  ReviewsState _mapFailureOrReviewsEntityToState(
      Either<Failure, ReviewsEntity> either, BuildContext context) {
    return either.fold(
      (failure) => ReviewsFailureState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (reviewsEntity) => ReviewsSuccessState(reviewsEntity: reviewsEntity),
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "serverFailure".tr(context);
      case OfflineFailure:
        return "offlineFailure".tr(context);
      case NotFoundFailure:
        return "There's No Reviews Yet";
      // return "no_data_found".tr(context);
      default:
        return "unExpectedFailure".tr(context);
    }
  }
}
