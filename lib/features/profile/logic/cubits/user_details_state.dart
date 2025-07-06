part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final UserDetailsModel userDetailsModel;
  UserDetailsLoaded({required this.userDetailsModel});
}

class UserDetailsError extends UserDetailsState {
  final String errorMessage;
  UserDetailsError({required this.errorMessage});
}
