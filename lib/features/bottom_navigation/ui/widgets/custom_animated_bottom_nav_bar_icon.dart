// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAnimatedBottomNavBarIcon extends StatelessWidget {
  const CustomAnimatedBottomNavBarIcon({
    Key? key,
    required this.isPressed,
    required this.pressedIconPath,
    required this.unPressedIconPath,
  }) : super(key: key);

  final bool isPressed;

  final String pressedIconPath;

  final String unPressedIconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.px),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: isPressed
            ? SvgPicture.asset(
                pressedIconPath,
                key: const ValueKey('after'),
                colorFilter: ColorFilter.mode(
                  context.appTheme.primaryColor,
                  BlendMode.srcATop,
                ),
              )
            : SvgPicture.asset(
                unPressedIconPath,
                key: const ValueKey('before'),
                colorFilter: ColorFilter.mode(
                  context.appTheme.bottomNavigationBarTheme
                          .unselectedItemColor ??
                      AppColorsManager.lightGrey,
                  BlendMode.srcATop,
                ),
              ),
      ),
    );
  }
}
