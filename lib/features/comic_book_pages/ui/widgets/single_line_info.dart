import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingleLineInfo extends StatelessWidget {
  final String title;
  final String? data;
  const SingleLineInfo({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return Column(
        children: [
          Gap(15.px),
          Row(
            children: [
              BodyHeaderText(data: title),
              Gap(10.px),
              BodyHeaderTextMedium(data: data!),
            ],
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
