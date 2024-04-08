import 'package:bloc/bloc.dart';
import 'package:comic_glance/features/signup/data/models/sign_up_request_body.dart';
import 'package:comic_glance/features/signup/data/repo/sign_up_repo.dart';
import 'package:comic_glance/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/widgets.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signUpRepo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignupCubit(
    this._signUpRepo,
  ) : super(
          const SignupState.initial(),
        );

  signUpWithEmailAndPassword() async {
    emit(const SignupState.loading());
    final response = await _signUpRepo.signUpWithEmailAndPassword(
      SignUpRequestBody(
          email: emailController.text, password: passwordController.text),
    );

    response.when(
      success: (data) {
        emit(SignupState.signupSuccess(data));
      },
      failure: (error) {
        emit(SignupState.signupError(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
