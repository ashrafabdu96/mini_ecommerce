import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/chekStringInputLanguage.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';
import 'package:mini_ecommerce/features/search/domain/use_cases/search_item_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchItemUseCase}) : super(SearchInitialState());
  List<SearchItemDataEntity>? searchItemDataEntity = [];

  final SearchItemUseCase searchItemUseCase;
  String query = '';
  searchForProduct(
      {required String query, required BuildContext context}) async {
    try {
      final result = await searchItemUseCase.call(query: query);
      emit(_mapFailureOrSearchItemEntityToState(result, context));
      print("$result cubit--->");
    } catch (e) {
      emit(
          _mapFailureOrSearchItemEntityToState(Left(ServerFailure()), context));
    }
  }

  getSuggestion({required BuildContext context}) async {
    try {
      emit(SearchLoadingState());
      final result = await searchItemUseCase.getSuggestion();
      emit(_mapFailureOrSearchItemEntityToState(result, context));
    } catch (e) {
      print('eeeeeeeeeee$e');
      emit(
          _mapFailureOrSearchItemEntityToState(Left(ServerFailure()), context));
    }
  }

  List<SearchItemDataEntity>? suggestionFilter(
      {String? query, List<SearchItemDataEntity>? allItems}) {
    return isArabic(query.toString())
        ? allItems!
            .where(
              (element) => element.itemsNameAr.toString().contains(
                    query.toString(),
                  ),
            )
            .toList()
        : allItems!
            .where(
              (element) => element.itemsName!.toLowerCase().contains(
                    query!.toLowerCase(),
                  ),
            )
            .toList();
  }

  ///helpers
  SearchState _mapFailureOrSearchItemEntityToState(
      Either<Failure, SearchItemEntity> either, BuildContext context) {
    return either.fold(
      (failure) {
        return SearchFailureState(
            status: _mapFailureToMessage(failure, context));
      },
      (entity) {
        searchItemDataEntity = entity.searchItemDataEntity;
        return SearchSuccessState(searchItemEntity: entity);
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
