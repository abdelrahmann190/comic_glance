import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/widgets/custom_error_dialog.dart';
import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/signup/logic/cubit/signup_cubit.dart';
import 'package:comic_glance/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloclistner extends StatelessWidget {
  const SignUpBloclistner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            setupLoadingState(context);
          },
          signupError: (error) {
            setupErrorState(context, error);
          },
          signupSuccess: (data) {
            context.pushNamedAndRemoveUntil(AppRoutes.mainNavigationPage);
          },
        );
      },
      child: Container(),
    );
  }

  void setupLoadingState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: LoadingWidget(),
      ),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomErrorDialog(error: error),
    );
  }
}
