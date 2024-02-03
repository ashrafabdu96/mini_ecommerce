part of 'reviews_cubit.dart';

@immutable
abstract class ReviewsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReviewsInitialState extends ReviewsState {}

class ReviewsSuccessState extends ReviewsState {
  final ReviewsEntity reviewsEntity;
  ReviewsSuccessState({required this.reviewsEntity});
}

class ReviewsLoadingState extends ReviewsState {}

class ReviewsFailureState extends ReviewsState {
  final String status;

  ReviewsFailureState({required this.status});
}
