part of 'google_signup_cubit.dart';

@immutable
abstract class GoogleSignupState {}

class GoogleSignupInitial extends GoogleSignupState {}

class GoogleSignupLoading extends GoogleSignupState {}

class GoogleSignupSuccess extends GoogleSignupState {}

class GoogleSignupError extends GoogleSignupState {
  final String errorMessage;
  GoogleSignupError({required this.errorMessage});
}
