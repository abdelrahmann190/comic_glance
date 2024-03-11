import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPasswordField;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.isPasswordField,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appTheme.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25.px),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              widget.icon,
              color: context.appTheme.primaryColor,
            ),
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: isPasswordVisible,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
              ),
            ),
          ),
          if (widget.isPasswordField)
            IconButton(
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                  widget.controller.text = widget.controller.text;
                  widget.controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.controller.text.length),
                  );
                });
              },
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: context.appTheme.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
