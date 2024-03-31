import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowMoreCard<T> extends StatelessWidget {
  final void Function()? onTap;
  final double? width;
  final double? height;
  const ShowMoreCard({
    super.key,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.px),
          color: context.appCustomTheme.primaryColor.withOpacity(0.1),
        ),
        child: const Center(
          child: Text(
            'Show more',
          ),
        ),
      ),
    );
  }
}
