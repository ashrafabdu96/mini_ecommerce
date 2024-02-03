part of 'rate_cubit.dart';

@immutable
abstract class RateState {}

class RateInitialState extends RateState {}

class RateBoughtState extends RateState {}

class RateNotBoughtState extends RateState {}

class RateAddingOrUpdatingSuccessState extends RateState {
  final Map<String, dynamic> result;

  RateAddingOrUpdatingSuccessState({required this.result});
}

class RateAddingOrUpdatingNothingChangeState extends RateState {}

class RateAddingOrUpdatingFailureState extends RateState {}

class RateAddingOrUpdatingLoadingState extends RateState {}
