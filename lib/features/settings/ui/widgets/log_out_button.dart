import 'package:comic_glance/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Log out',
          style: TextStyles.font20DynamicMedium.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
