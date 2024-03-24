import 'package:comic_glance/core/helpers/html_handler.dart';
import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DescriptionViewWidget extends StatelessWidget {
  final String? description;
  const DescriptionViewWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    if (description != null) {
      return Column(
        children: [
          Gap(30.px),
          const BodyHeaderText(data: 'Describtion'),
          Gap(15.px),
          BodyHeaderTextMedium(
            data: HtmlHandler.turnHtmlTextToString(description!),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
