import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loginSuccess(T data) = LoginSuccess<T>;
  const factory LoginState.logoutSuccess() = LogoutSuccess;
  const factory LoginState.changePasswordSuccess() = ChangePasswordSuccess;

  const factory LoginState.loading() = Loading;
  const factory LoginState.loginError(String error) = LoginError;
  const factory LoginState.logoutError(String error) = LogOutError;
  const factory LoginState.changePasswordError(String error) =
      ChangePasswordError;
}
