import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    this.onPressed,
    required this.isItemAdded,
  });
  final void Function()? onPressed;
  final bool isItemAdded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.px),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white70,
      ),
      child: IconButton(
        isSelected: isItemAdded,
        icon: const Icon(
          Icons.favorite_border,
          color: Colors.red,
        ),
        selectedIcon: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
