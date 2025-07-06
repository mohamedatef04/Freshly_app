import 'package:freshly_app/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel userModel,
  });

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> saveUserData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<void> googleSignIn();
}
