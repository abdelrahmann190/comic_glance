import 'package:comic_glance/core/widgets/custom_text_form_field.dart';
import 'package:comic_glance/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            icon: Icons.email_rounded,
            controller: context.read<LoginCubit>().emailController,
            isPasswordField: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid email';
              }
              return null;
            },
          ),
          Gap(15.px),
          CustomTextFormField(
            hintText: 'password',
            icon: Icons.password_rounded,
            controller: context.read<LoginCubit>().passwordController,
            isPasswordField: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (p0) {
              return 'please enter';
            },
            obsecureText: isObscureText,
          ),
        ],
      ),
    );
  }
}
