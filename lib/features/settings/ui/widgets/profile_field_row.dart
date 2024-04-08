import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileFieldRow extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const ProfileFieldRow({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.px,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            BodyHeaderTextMedium(data: title),
          ],
        ),
      ),
    );
  }
}
