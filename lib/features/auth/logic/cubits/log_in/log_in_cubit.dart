import 'package:bloc/bloc.dart';
import 'package:freshly_app/features/auth/logic/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.authRepo) : super(LogInInitial());

  final AuthRepo authRepo;

  Future<void> logIn({required String email, required String password}) async {
    emit(LogInLoading());
    try {
      await authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LogInSuccess());
    } catch (e) {
      emit(LogInFailure(errorMessage: e.toString()));
    }
  }
}
