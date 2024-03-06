// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class BodyContentTextLight extends StatelessWidget {
  final String data;
  const BodyContentTextLight({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyles.font13DynamicLight.copyWith(
        color: context.appTheme.primaryColor.withOpacity(0.5),
      ),
    );
  }
}
