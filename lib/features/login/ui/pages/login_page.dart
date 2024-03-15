import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:comic_glance/core/widgets/round_text_button.dart';
import 'package:comic_glance/features/login/logic/cubit/login_cubit.dart';
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
          child: Container(
            width: 80.w,
            height: 50.h,
            padding: EdgeInsets.symmetric(
              horizontal: 15.px,
              vertical: 15.px,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.appTheme.canvasColor.withOpacity(0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MainPageHeaderText(data: 'Log in'),
                Gap(30.px),
                const LoginForm(),
                Gap(15.px),
                RoundTextbutton(
                  color: context.appTheme.canvasColor,
                  data: 'Login',
                  onTap: () {
                    context.read<LoginCubit>().emitLoginState();
                  },
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setupErrorState(BuildContext context, String error) {}
}
