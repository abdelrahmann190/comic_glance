import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.authenticated() = Authenticated;
  const factory AuthenticationState.unAuthenticated() = UnAuthenticated;
}
