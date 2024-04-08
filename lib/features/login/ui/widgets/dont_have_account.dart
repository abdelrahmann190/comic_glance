import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Dont have an account?',
            style: TextStyles.font13DynamicMedium.copyWith(
              color: context.appCustomTheme.primaryColor.withOpacity(0.6),
            ),
          ),
          WidgetSpan(
            child: SizedBox(width: 10.px),
          ),
          TextSpan(
            text: 'Sign up',
            style: TextStyles.font13DynamicMedium,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamedAndRemoveUntil(AppRoutes.signUpPage);
              },
          ),
        ],
      ),
    );
  }
}
