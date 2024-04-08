import 'package:comic_glance/core/networking/api_result.dart';
import 'package:comic_glance/core/networking/app_auth_services.dart';
import 'package:comic_glance/core/networking/networking_error_handler.dart';
import 'package:comic_glance/features/signup/data/models/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  final AppAuthServices _appAuthServices;

  SignUpRepo(this._appAuthServices);
  Future<ApiResult<UserCredential>> signUpWithEmailAndPassword(
      SignUpRequestBody signUpRequestBody) async {
    try {
      return ApiResult.success(
        await _appAuthServices.signUpWithEmailAndPassword(
          email: signUpRequestBody.email,
          password: signUpRequestBody.password,
        ),
      );
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }
}
