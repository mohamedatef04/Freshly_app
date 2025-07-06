part of 'rating_cubit.dart';

@immutable
abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingValueAdded extends RatingState {}

class RatingValueUpdated extends RatingState {}

class RatingValueFailed extends RatingState {
  final String errorMessage;
  RatingValueFailed({required this.errorMessage});
}
