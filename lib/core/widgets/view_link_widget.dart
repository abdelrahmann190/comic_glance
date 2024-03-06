// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewLinkWidget extends StatelessWidget {
  final String navigationLink;
  final WebViewController controller;

  const ViewLinkWidget({
    Key? key,
    required this.navigationLink,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
