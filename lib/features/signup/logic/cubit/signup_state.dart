import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;
  const factory SignupState.signupError(String error) = SignupError;
  const factory SignupState.loading() = Loading;
}
