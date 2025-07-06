import 'package:bloc/bloc.dart';
import 'package:freshly_app/features/auth/logic/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'google_signup_state.dart';

class GoogleSignupCubit extends Cubit<GoogleSignupState> {
  GoogleSignupCubit(this.authRepo) : super(GoogleSignupInitial());

  final AuthRepo authRepo;

  Future<void> googleSignIn() async {
    emit(GoogleSignupLoading());
    try {
      await authRepo.googleSignIn();
      emit(GoogleSignupSuccess());
    } catch (e) {
      emit(GoogleSignupError(errorMessage: e.toString()));
    }
  }
}
