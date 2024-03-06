// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/networking/api_result.dart';
import 'package:comic_glance/core/networking/app_auth_services.dart';
import 'package:comic_glance/core/networking/networking_error_handler.dart';
import 'package:comic_glance/features/login/data/models/login_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  const LoginRepo(
    this._appAuthServices,
  );

  final AppAuthServices _appAuthServices;

  Future<ApiResult<UserCredential>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      return ApiResult.success(
        await _appAuthServices.loginWithEmailAndPassword(
          email: loginRequestBody.email,
          password: loginRequestBody.password,
        ),
      );
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<UserCredential> signup({
    required String email,
    required String password,
  }) async {
    return await _appAuthServices.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    _appAuthServices.signOut();
  }
}
