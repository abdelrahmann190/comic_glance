import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/networking/website_images_service.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/card_cover_image.dart';
import 'package:flutter/material.dart';
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
    super.build;
    return Container(
      width: 100.px,
      margin: EdgeInsets.only(right: 15.px),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          context.pushNamed(
            AppRoutes.getRouteAccordingToApiLink(
                widget.creditsModel.apiDetailUrl ?? ''),
            arguments: {
              ApiConstants.apiNavLink: widget.creditsModel.apiDetailUrl ?? '',
              ApiConstants.siteNavLink: widget.creditsModel.siteDetailUrl ?? '',
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 120.px,
              width: 100.px,
              child: FutureBuilder(
                future: getItInstance<WebsiteImagesService>()
                    .fetchImageFromWebsiteLink(
                        widget.creditsModel.siteDetailUrl ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  } else if (snapshot.hasError) {
                    return buildPlaceHolderWidget();
                  } else if (snapshot.data == null) {
                    return const Text('No image found');
                  } else {
                    return CardCoverImage(imageUrl: snapshot.data!);
                  }
                },
              ),
            ),
            BodyHeaderTextMedium(
              data:
                  '${widget.creditsModel.name ?? widget.creditsModel.issueNumber}',
            ),
            if (widget.creditsModel.role != null)
              BodyHeaderTextMedium(data: widget.creditsModel.role!),
          ],
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
