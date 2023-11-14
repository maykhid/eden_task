import 'package:eden_task/app/features/auth/data/model/authenticated_user.dart';

abstract class AuthenticationInterface {
  AuthenticatedUser get user;
  Future<void> signInGithub();
  Future<void> signInWithGoogle();
}
