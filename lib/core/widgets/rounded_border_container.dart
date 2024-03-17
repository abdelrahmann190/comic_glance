// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoundedBorderContainer extends StatelessWidget {
  const RoundedBorderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.px),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appCustomTheme.splashColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
