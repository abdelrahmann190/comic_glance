import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class CustomErrorDialog extends StatelessWidget {
  final String error;
  const CustomErrorDialog({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DynamicMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font15DynamicMedium,
          ),
        ),
      ],
    );
  }
}
