import 'package:eden_task/app/features/auth/data/authentication_interface.dart';
import 'package:eden_task/app/features/auth/data/model/authenticated_user.dart';
import 'package:eden_task/core/data/model/result.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthenticationRepository {
  AuthenticationRepository({
    required AuthenticationInterface authenticationInterface,
  }) : _authenticationInterface = authenticationInterface;

  final AuthenticationInterface _authenticationInterface;

  AuthenticatedUser get user => _authenticationInterface.user;

  Future<Result<void>> signInWithGithub() async {
    try {
      final response = await _authenticationInterface.signInGithub();
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> signInWithGoogle() async {
    try {
      final response = await _authenticationInterface.signInWithGoogle();
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }
}
