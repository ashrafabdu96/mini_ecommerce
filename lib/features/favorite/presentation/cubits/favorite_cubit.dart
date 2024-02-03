import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_operation_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/use_cases/add_to_cart_from_fav_usecase.dart';
import 'package:mini_ecommerce/features/favorite/domain/use_cases/delete_fav_usecase.dart';
import 'package:mini_ecommerce/features/favorite/domain/use_cases/get_fav_data_usecase.dart';
import 'package:mini_ecommerce/injection_container.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
      {required this.addToCartFromFavUseCase,
      required this.getFavDataUseCase,
      required this.deleteFavUseCase})
      : super(FavoriteInitialState());
  List<FavoriteDataEntity> favoriteProductsList = [];
  GetFavDataUseCase getFavDataUseCase;
  DeleteFavUseCase deleteFavUseCase;
  AddToCartFromFavUseCase addToCartFromFavUseCase;

  getFavoriteData(BuildContext context) async {
    try {
      emit(FavoriteLoadingState());
      var result = await getFavDataUseCase(int.parse(getUserId()));
      emit(_mapFailureOrFavoriteEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrFavoriteEntityToState(Left(ServerFailure()), context));
    }
  }

  deleteFavorite(int itemId, BuildContext context) async {
    try {
      // emit(FavoriteOperationLoadingState());
      var result = await deleteFavUseCase(int.parse(getUserId()), itemId);
      emit(_mapFailureOrFavoriteOperationEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrFavoriteOperationEntityToState(
          Left(ServerFailure()), context));
    }
  }

  addToCartFromFavorite(int itemId, BuildContext context) async {
    try {
      // emit(FavoriteOperationLoadingState());
      var result =
          await addToCartFromFavUseCase(int.parse(getUserId()), itemId);
      emit(_mapFailureOrFavoriteOperationAddEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrFavoriteOperationAddEntityToState(
          Left(ServerFailure()), context));
    }
  }

  ///***helpers
  FavoriteState _mapFailureOrFavoriteEntityToState(
      Either<Failure, FavoriteEntity> either, BuildContext context) {
    return either.fold(
      (failure) => FavoriteErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (favoriteEntity) {
        favoriteProductsList
            .addAll(favoriteEntity.favoriteDataEntity!.toList());
        return FavoriteSuccessState(favoriteEntity: favoriteEntity);
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
      case AddFailure:
        return "add_failure".tr(context);
      default:
        return "unExpectedFailure".tr(context);
    }
  }

  ///operation helper
  FavoriteState _mapFailureOrFavoriteOperationEntityToState(
    Either<Failure, FavoriteOperationEntity> either,
    BuildContext context,
  ) {
    return either.fold(
      (failure) => FavoriteDeleteErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (favoriteOperationEntity) {
        return FavoriteDeleteSuccessState(
            favoriteOperationEntity: favoriteOperationEntity);
      },
    );
  }

  FavoriteState _mapFailureOrFavoriteOperationAddEntityToState(
    Either<Failure, FavoriteOperationEntity> either,
    BuildContext context,
  ) {
    return either.fold(
      (failure) => FavoriteAddErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (favoriteOperationEntity) {
        return FavoriteAddSuccessState(
            favoriteOperationEntity: favoriteOperationEntity);
      },
    );
  }

  showMessage({required FavoriteState state, required BuildContext context}) {
    if (state is FavoriteAddSuccessState) {
      showSnackMessage(
        context: context,
        bkgColor: AppColors.kShapesColor,
        textColor: AppColors.kWhiteFonts,
        message: "Added SuccessFully",
      );
    } else if (state is FavoriteAddErrorState) {
      showSnackMessage(
        context: context,
        bkgColor: Colors.red,
        textColor: AppColors.kWhiteFonts,
        message: state.status,
      );
    } else if (state is FavoriteDeleteSuccessState) {
      showSnackMessage(
        context: context,
        bkgColor: AppColors.kShapesColor,
        textColor: AppColors.kWhiteFonts,
        message: "Deleted SuccessFully",
      );
    } else if (state is FavoriteDeleteErrorState) {
      showSnackMessage(
        context: context,
        bkgColor: AppColors.kShapesColor,
        textColor: AppColors.kWhiteFonts,
        message: "Deleted SuccessFully",
      );
    }
  }
}
