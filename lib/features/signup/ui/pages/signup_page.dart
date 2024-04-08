import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/widgets/auth_form.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:comic_glance/core/widgets/round_text_button.dart';
import 'package:comic_glance/features/signup/logic/cubit/signup_cubit.dart';
import 'package:comic_glance/features/signup/ui/widgets/already_have_account.dart';
import 'package:comic_glance/features/signup/ui/widgets/sign_up_bloclistner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/batman_bg.jpg'),
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.px,
                  vertical: 15.px,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.px),
                  color: context.appCustomTheme.canvasColor.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const MainPageHeaderText(data: 'Sign up'),
                    Gap(30.px),
                    AuthForm(
                      formKey: context.read<SignupCubit>().formKey,
                      emailController:
                          context.read<SignupCubit>().emailController,
                      passwordController:
                          context.read<SignupCubit>().passwordController,
                    ),
                    Gap(15.px),
                    RoundTextbutton(
                      color: context.appCustomTheme.canvasColor,
                      data: 'Signup',
                      onTap: () {
                        if (context
                            .read<SignupCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context
                              .read<SignupCubit>()
                              .signUpWithEmailAndPassword();
                        }
                      },
                    ),
                    Gap(15.px),
                    const AlreadyHaveAccount(),
                    const SignUpBloclistner(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
