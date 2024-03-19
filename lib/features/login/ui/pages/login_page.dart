import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:comic_glance/core/widgets/round_text_button.dart';
import 'package:comic_glance/features/login/logic/cubit/login_cubit.dart';
import 'package:comic_glance/features/login/ui/widgets/dont_have_account.dart';
import 'package:comic_glance/features/login/ui/widgets/login_bloclistner.dart';
import 'package:comic_glance/features/login/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<LoginCubit>(),
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

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
                    const MainPageHeaderText(data: 'Log in'),
                    Gap(30.px),
                    const LoginForm(),
                    Gap(15.px),
                    RoundTextbutton(
                      color: context.appCustomTheme.canvasColor,
                      data: 'Login',
                      onTap: () {
                        if (context
                            .read<LoginCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<LoginCubit>().emitLoginState();
                        }
                      },
                    ),
                    Gap(15.px),
                    const DontHaveAccount(),
                    const LoginBlocListener(),
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
