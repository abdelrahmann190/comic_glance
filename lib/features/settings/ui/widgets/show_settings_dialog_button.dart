import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowSettingsDialogButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const ShowSettingsDialogButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.px),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(5.px),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyles.font15DynamicMedium.copyWith(
                color: context.appTheme.primaryColor.withOpacity(0.6),
              ),
            ),
            Gap(5.px),
            const Icon(
              Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}
