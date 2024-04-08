import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/widgets/custom_text_form_field.dart';
import 'package:comic_glance/core/widgets/round_text_button.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordDialog extends StatefulWidget {
  final LoginCubit loginCubitInstance;
  const ChangePasswordDialog({super.key, required this.loginCubitInstance});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final oldPasswordContoller = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(10.px),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildPasswordField(
                'old password',
                oldPasswordContoller,
              ),
              Gap(15.px),
              buildPasswordField(
                'new password',
                newPasswordController,
              ),
              Gap(15.px),
              RoundTextbutton(
                data: 'Update',
                color: Colors.red,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    widget.loginCubitInstance.changePassword(
                      oldPassword: oldPasswordContoller.text,
                      newPassword: newPasswordController.text,
                    );
                    context.pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextFormField buildPasswordField(
      String hintText, TextEditingController textController) {
    return CustomTextFormField(
      hintText: hintText,
      icon: Icons.password_rounded,
      controller: textController,
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
    );
  }

  @override
  void dispose() {
    oldPasswordContoller.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}
