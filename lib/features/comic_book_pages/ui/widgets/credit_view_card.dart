import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/networking/website_images_service.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreditViewCard extends StatefulWidget {
  final CreditsModel creditsModel;
  const CreditViewCard({
    required this.creditsModel,
    super.key,
  });

  @override
  State<CreditViewCard> createState() => _CreditViewCardState();
}

class _CreditViewCardState extends State<CreditViewCard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.px,
      height: 120.px,
      margin: EdgeInsets.only(right: 15.px),
      child: Column(
        children: [
          SizedBox(
            width: 100.px,
            height: 120.px,
            child: FutureBuilder(
              future: getItInstance<WebsiteImagesService>()
                  .fetchImageFromWebsiteLink(
                      widget.creditsModel.siteDetailUrl ?? ''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); // or some other loader
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null) {
                  return const Text('No image found');
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      filterQuality: FilterQuality.low,
                      imageUrl: snapshot.data!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset(
                        fit: BoxFit.cover,
                        'assets/images/placeholder.jpg',
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        fit: BoxFit.cover,
                        'assets/images/placeholder.jpg',
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Gap(
            15.px,
          ),
          BodyHeaderTextMedium(
            data: widget.creditsModel.name ?? '',
          ),
        ],
      ),
    );
  }
}
