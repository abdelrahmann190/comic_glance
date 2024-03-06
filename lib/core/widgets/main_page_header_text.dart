import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/core/widgets/rounded_border_container.dart';
import 'package:flutter/material.dart';

class MainPageHeaderText extends StatelessWidget {
  final String data;
  const MainPageHeaderText({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBorderContainer(
      child: Text(
        data,
        style: TextStyles.font28DynamicBold,
      ),
    );
  }
}
