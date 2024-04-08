import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    required this.icon,
  });
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.px),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
