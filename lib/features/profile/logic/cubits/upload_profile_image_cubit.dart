import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freshly_app/features/profile/logic/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'upload_profile_image_state.dart';

class UploadProfileImageCubit extends Cubit<UploadProfileImageState> {
  UploadProfileImageCubit(this.profileRepo)
    : super(UploadProfileImageInitial());
  final ProfileRepo profileRepo;

  Future<void> uploadProfileImage({
    required File image,
    required String path,
  }) async {
    emit(UploadProfileImageLoading());
    try {
      await profileRepo.uplaodProfileIamge(image: image, path: path);
      emit(UploadProfileImageSuccess());
    } on Exception catch (e) {
      emit(UploadProfileImageFailure(errorMessage: e.toString()));
    }
  }
}
