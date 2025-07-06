import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> uploadProfileImage({
    required String bucketName,
    required File image,
    required String path,
  }) async {
    await supabase.storage.from(bucketName).upload(path, image);
  }

  String getProfileImageUrl({
    required String bucketName,
    required String path,
  }) {
    return supabase.storage.from(bucketName).getPublicUrl(path);
  }
}
