import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/widgets/custom_error_dialog.dart';
import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_cubit.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            setupLoadingState(context);
          },
          loginSuccess: (loginResponse) {
            context.pushNamedAndRemoveUntil(AppRoutes.mainNavigationPage);
          },
          loginError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
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
