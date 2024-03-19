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
  final void Function(String)? onFieldSubmitted;
  final bool addClearButton;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.isPasswordField,
    required this.validator,
    this.obsecureText,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.addClearButton = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.px),
      decoration: BoxDecoration(
        color: context.appCustomTheme.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(50.px),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.px),
            child: Icon(
              icon,
              color: context.appCustomTheme.primaryColor,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: onFieldSubmitted,
              validator: validator,
              obscureText: obsecureText ?? false,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: suffixIcon,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.px,
                  vertical: 10.px,
                ),
                errorMaxLines: 2,
                errorStyle: TextStyle(
                  fontSize: 10.px,
                ),
              ),
            ),
          ),
          if (addClearButton)
            IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: const Icon(Icons.clear),
            )
        ],
      ),
    );
  }
}
