import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DescriptionViewWidget extends StatefulWidget {
  final String? description;

  const DescriptionViewWidget({Key? key, required this.description})
      : super(key: key);

  @override
  DescriptionViewWidgetState createState() => DescriptionViewWidgetState();
}

class DescriptionViewWidgetState extends State<DescriptionViewWidget> {
  bool isExpanded = false;
  bool showButton = true;

  late String firstPart;
  late String secondPart;

  @override
  Widget build(BuildContext context) {
    if (widget.description != null && widget.description!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(30.px),
          const BodyHeaderText(data: 'Description'),
          Gap(15.px),
          SizedBox(
            height: isExpanded ? null : 200.px,
            child: buildHTMLWidgets(),
          ),
          Gap(5.px),
          if (showButton)
            InkWell(
              onTap: _toggleExpanded,
              child: Text(
                isExpanded ? 'Shrink' : 'Expand',
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget buildHTMLWidgets() {
    return SingleChildScrollView(
      child: HtmlWidget(
        widget.description!,
        baseUrl: Uri.parse(ApiConstants.baseUrl),
        onTapUrl: (url) {
          final apiLink = ApiConstants.buildACustomLinkFromNavigationUrl(
            url,
          );
          context.pushNamed(
            AppRoutes.getRouteAccordingToApiLink(
              url,
            ),
            arguments: {
              ApiConstants.apiNavLink: apiLink,
              ApiConstants.siteNavLink: '',
            },
          );
          return false;
        },
        renderMode: RenderMode.column,
        textStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _calculateTextParts() {
    final span = TextSpan(text: widget.description);
    final tp = TextPainter(
      text: span,
      maxLines: 6,
      textDirection: TextDirection.ltr,
    );
    tp.layout(
      maxWidth: 100.w,
    );

    if (tp.didExceedMaxLines) {
    } else {
      showButton = false;
    }
  }

  @override
  void initState() {
    _calculateTextParts();
    super.initState();
  }
}
