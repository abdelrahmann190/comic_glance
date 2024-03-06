// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class BodyHeaderTextMedium extends StatelessWidget {
  const BodyHeaderTextMedium({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyles.font15DynamicMedium,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
