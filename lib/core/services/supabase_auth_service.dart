import 'package:freshly_app/core/network/supabase_constants.dart';
import 'package:freshly_app/core/errors/custom_exeption.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase.auth.signUp(password: password, email: email);
      return user.user!;
    } on AuthException catch (e) {
      throw CustomExeption(errorMessage: e.message);
    } catch (e) {
      throw const CustomExeption(errorMessage: 'something went wrong');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );
      return user.user!;
    } on AuthException catch (e) {
      throw CustomExeption(errorMessage: e.message);
    } catch (e) {
      throw const CustomExeption(errorMessage: 'something went wrong');
    }
  }

  GoogleSignInAccount? googleUser;

  Future<void> googleSignIn() async {
    const webClientId = webClientIdd;

    const iosClientId = 'my-ios.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw 'Google Sign In was cancelled';
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  Future<bool> isSignedIn() async {
    if (supabase.auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
