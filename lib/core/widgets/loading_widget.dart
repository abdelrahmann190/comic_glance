import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.px,
      height: 100.px,
      child: CircularProgressIndicator(
        color: context.appTheme.primaryColor,
      ),
    );
  }
}
