import 'package:eden_task/app/features/auth/data/authentication_interface.dart';
import 'package:eden_task/app/features/auth/data/model/authenticated_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthenticationInterface)
class FirebaseAuthentication implements AuthenticationInterface {
  FirebaseAuthentication({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth {
    _firebaseAuth.authStateChanges().listen((user) => _user = user);
  }

  final FirebaseAuth _firebaseAuth;
  User? _user;

  @override
  Future<void> signInGithub() async {
    try {
      final githubProvider = GithubAuthProvider();
      await _firebaseAuth.signInWithProvider(githubProvider);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  AuthenticatedUser get user {
    return AuthenticatedUser(
      id: _user?.uid ?? '',
      name: _user?.displayName,
      email: _user?.email,
      imageUrl: _user?.photoURL,
    );
  }
}
