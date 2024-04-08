import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/core/widgets/custom_error_dialog.dart';
import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_cubit.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PasswordUpdateBloclistner extends StatelessWidget {
  const PasswordUpdateBloclistner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            setupLoadingState(context);
          },
          changePasswordSuccess: () {
            setupSuccessState(context);
          },
          changePasswordError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  setupSuccessState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Dialog(
          child: Padding(
            padding: EdgeInsets.all(10.px),
            child: const BodyHeaderText(
              data: 'Password updated succesfully',
            ),
          ),
        ),
      ),
    );
    // Future.delayed(const Duration(seconds: 3)).then(
    //   (value) => context.pop(),
    // );
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
    showDialog(
      context: context,
      builder: (context) => CustomErrorDialog(error: error),
    );
  }
}
