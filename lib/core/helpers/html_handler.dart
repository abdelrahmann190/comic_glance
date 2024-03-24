import 'package:html/parser.dart';

class HtmlHandler {
  static String turnHtmlTextToString(String htmlText) {
    final document = parse(htmlText);
    return document.body?.text ?? '';
  }
}
