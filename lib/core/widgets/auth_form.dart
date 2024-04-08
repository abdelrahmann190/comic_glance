import 'package:comic_glance/core/helpers/app_regex.dart';
import 'package:comic_glance/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const AuthForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            icon: Icons.email_rounded,
            controller: widget.emailController,
            isPasswordField: false,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'please enter a valid email';
              }
              return null;
            },
          ),
          Gap(15.px),
          CustomTextFormField(
            hintText: 'password',
            icon: Icons.password_rounded,
            controller: widget.passwordController,
            isPasswordField: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              if (value.length < 8) {
                return 'password should be 8 characters or more';
              }
              return null;
            },
            obsecureText: isObscureText,
          ),
        ],
      ),
    );
  }
}
