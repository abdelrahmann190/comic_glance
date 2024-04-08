import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/core/widgets/custom_error_dialog.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_cubit.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.red.withOpacity(0.2),
      ),
      onPressed: () {
        context.read<LoginCubit>().logOut();
      },
      child: Column(
        children: [
          Text(
            'Log out',
            style: TextStyles.font20DynamicMedium.copyWith(color: Colors.red),
          ),
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              state.whenOrNull(
                loading: () {
                  showDialog(
                    context: context,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                logoutSuccess: () {
                  context.pushNamedAndRemoveUntil(AppRoutes.loginPage);
                },
                logoutError: (error) {
                  context.pop();
                  showDialog(
                    context: context,
                    builder: (context) => CustomErrorDialog(
                      error: error,
                    ),
                  );
                },
              );
            },
            child: Container(),
          )
        ],
      ),
    );
  }
}
