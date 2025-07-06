import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freshly_app/core/errors/custom_exeption.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/core/network/supabase_constants.dart';
import 'package:freshly_app/core/services/supabase_storage_service.dart';
import 'package:freshly_app/features/profile/data/models/user_model.dart';
import 'package:freshly_app/features/profile/logic/repos/profile_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;
  final SupabaseStorageService storageService;

  ProfileRepoImpl({required this.apiService, required this.storageService});
  @override
  Future<Either<Failures, UserDetailsModel>> getUserData() async {
    try {
      final res = await apiService.get(endPoint: usersEndPoint);
      List<dynamic> jsonData = res.data;

      UserDetailsModel? userDetailsModel;

      for (var element in jsonData) {
        if (element['id'] == Supabase.instance.client.auth.currentUser!.id) {
          userDetailsModel = UserDetailsModel.fromJson(element);
        }
      }
      return right(userDetailsModel!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<void> uplaodProfileIamge({
    required File image,
    required String path,
  }) async {
    try {
      await storageService.uploadProfileImage(
        bucketName: storageBucketName,
        image: image,
        path: path,
      );
      final url = getProfileImageUrl(bucketName: storageBucketName, path: path);
      await storeUserImageUrl(url: url);
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  String getProfileImageUrl({
    required String bucketName,
    required String path,
  }) {
    return storageService.getProfileImageUrl(
      bucketName: bucketName,
      path: path,
    );
  }

  @override
  Future<void> storeUserImageUrl({required String url}) async {
    try {
      await apiService.update(
        endPoint:
            '$usersEndPoint?id=eq.${Supabase.instance.client.auth.currentUser!.id}',
        data: {'image_url': url},
      );
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }
}
