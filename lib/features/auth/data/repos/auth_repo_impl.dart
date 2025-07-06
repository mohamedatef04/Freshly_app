import 'package:freshly_app/core/network/supabase_constants.dart';
import 'package:freshly_app/core/services/supabase_auth_service.dart';
import 'package:freshly_app/core/services/supabase_database_service.dart';
import 'package:freshly_app/core/errors/custom_exeption.dart';
import 'package:freshly_app/features/auth/data/models/user_model.dart';
import 'package:freshly_app/features/auth/logic/repos/auth_repo.dart';
import 'package:gotrue/src/types/user.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService supabaseAuthService;
  final SupabaseDatabaseService supabaseDatabaseService;

  AuthRepoImpl(this.supabaseAuthService, this.supabaseDatabaseService);
  @override
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    try {
      final user = await supabaseAuthService.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      saveUserData(
        path: usersTable,
        data: {
          'name': userModel.userName,
          'email': userModel.userEmail,
          'phone': userModel.userPhone,
          'address': userModel.userAddress,
        },
      );

      return user;
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }

  @override
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }

  @override
  Future<void> saveUserData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await supabaseDatabaseService.storeUserData(path: path, data: data);
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<void> googleSignIn() async {
    try {
      await supabaseAuthService.googleSignIn();
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }
}
