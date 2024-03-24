import 'package:dio/dio.dart';
import 'package:html/parser.dart';

class WebsiteImagesService {
  final Dio dio;

  WebsiteImagesService(this.dio);

  Future<String?> fetchImageFromWebsiteLink(String websitePath) async {
    final url = Uri(
      scheme: 'https',
      host: 'www.comicvine.gamespot.com',
      path: websitePath,
    );
    try {
      final response = await dio.getUri(url);
      final document = parse(response.data);
      final images = document.querySelectorAll('img');
      if (images.isNotEmpty) {
        // Assuming the src attribute contains the image URL
        return images.first.attributes['src'];
      } else {
        return 'No images found';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
