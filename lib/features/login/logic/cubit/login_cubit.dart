// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/features/login/data/models/login_request_body.dart';
import 'package:comic_glance/features/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comic_glance/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginRepo,
  ) : super(
          const LoginState.initial(),
        );

  final LoginRepo _loginRepo;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    const LoginState.loading();

    final response = await _loginRepo.login(
      loginRequestBody: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (data) {
        emit(
          LoginState.success(data),
        );
      },
      failure: (error) {
        emit(
          LoginState.error(
            error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}
