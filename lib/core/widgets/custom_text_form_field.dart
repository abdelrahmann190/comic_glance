import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPasswordField;
  final String? Function(String?) validator;
  final bool? obsecureText;
  final Widget? suffixIcon;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.isPasswordField,
    required this.validator,
    this.obsecureText,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appCustomTheme.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25.px),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: context.appCustomTheme.primaryColor,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              obscureText: obsecureText ?? false,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: suffixIcon,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.px,
                  vertical: 15.px,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
