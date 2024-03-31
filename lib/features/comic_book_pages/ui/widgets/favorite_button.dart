import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    this.onPressed,
    required this.isItemAddedNotifier,
  });
  final void Function()? onPressed;
  final ValueNotifier<bool> isItemAddedNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isItemAddedNotifier,
        builder: (context, value, child) {
          return Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: Colors.white70,
              isSelected: value,
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
        });
  }
}
