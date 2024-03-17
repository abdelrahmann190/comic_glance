import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoundTextbutton extends StatelessWidget {
  final String data;
  final Color color;
  final void Function()? onTap;
  const RoundTextbutton({
    super.key,
    required this.color,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.px),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.px,
          horizontal: 30.px,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.px),
          color: color,
        ),
        child: BodyHeaderText(
          data: data,
        ),
      ),
    );
  }
}
