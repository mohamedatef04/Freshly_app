import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failures, UserDetailsModel>> getUserData();

  Future<void> uplaodProfileIamge({required File image, required String path});

  String getProfileImageUrl({required String bucketName, required String path});

  Future<void> storeUserImageUrl({required String url});
}
