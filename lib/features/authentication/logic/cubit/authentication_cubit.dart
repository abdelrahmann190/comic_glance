import 'package:bloc/bloc.dart';
import 'package:comic_glance/features/authentication/logic/cubit/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(
          const AuthenticationState.initial(),
        );
}
