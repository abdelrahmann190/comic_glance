import 'package:flutter/material.dart';

class RadioButtonRow extends StatelessWidget {
  final String label;
  final ValueNotifier valueNotifier;
  final void Function(String?)? onChanged;

  const RadioButtonRow({
    super.key,
    required this.label,
    required this.valueNotifier,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, selectedValue, child) {
          return RadioListTile<String>(
            title: Text(label),
            value: label,
            groupValue: selectedValue,
            onChanged: onChanged,
          );
        });
  }
}
