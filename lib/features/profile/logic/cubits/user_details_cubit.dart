import 'package:bloc/bloc.dart';
import 'package:freshly_app/features/profile/data/models/user_model.dart';
import 'package:freshly_app/features/profile/logic/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(this.profileRepo) : super(UserDetailsInitial());
  final ProfileRepo profileRepo;

  Future<void> getUserData() async {
    emit(UserDetailsLoading());
    final res = await profileRepo.getUserData();
    res.fold(
      (l) => emit(UserDetailsError(errorMessage: l.errorMessage)),
      (r) => emit(UserDetailsLoaded(userDetailsModel: r)),
    );
  }
}
