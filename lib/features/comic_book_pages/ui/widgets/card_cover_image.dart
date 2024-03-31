import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardCoverImage extends StatelessWidget {
  const CardCoverImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });
  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.px),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => buildPlaceHolderWidget(),
          errorWidget: (context, url, error) => buildPlaceHolderWidget(),
        ),
      ),
    );
  }

  Image buildPlaceHolderWidget() {
    return Image.asset(
      fit: BoxFit.cover,
      'assets/images/placeholder.jpg',
    );
  }
}
