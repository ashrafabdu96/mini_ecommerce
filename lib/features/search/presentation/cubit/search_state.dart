part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchSuccessState extends SearchState {
  final SearchItemEntity searchItemEntity;

  SearchSuccessState({required this.searchItemEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [searchItemEntity];
}

class SearchLoadingState extends SearchState {}

class SearchFailureState extends SearchState {
  final String status;

  SearchFailureState({required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
