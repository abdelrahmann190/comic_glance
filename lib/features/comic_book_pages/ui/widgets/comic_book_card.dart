// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_glance/core/helpers/date_time_helper.dart';
import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/widgets/body_content_text_light.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';

class ComicBookCard extends StatefulWidget {
  final CommonDataModel data;

  const ComicBookCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  ComicBookCardState createState() => ComicBookCardState();
}

class ComicBookCardState extends State<ComicBookCard> {
  bool _isButtonsVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        setState(() {
          _isButtonsVisible = false;
        });
      },
      onTap: cardOnTapFunction,
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 160.px,
                      height: 230.px,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: widget.data.imageModel.thumbUrl ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.px,
                      height: _isButtonsVisible ? 230.px : 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.px),
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                Gap(10.px),
                SizedBox(
                  width: 160.px,
                  child: BodyHeaderTextMedium(
                    data: widget.data.name ?? widget.data.description ?? '',
                  ),
                ),
                Gap(5.px),
                SizedBox(
                  width: 160.px,
                  child: BodyContentTextLight(
                    data: DateTimeHelper.formateYMD(
                      widget.data.dateLastUpdated ?? '',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void cardOnTapFunction() {
    if (_isButtonsVisible) {
      setState(
        () {
          _isButtonsVisible = !_isButtonsVisible;
        },
      );

      context.pushNamed(
        AppRoutes.getRouteAccordingToApiLink(
          widget.data.apiDetailUrl ?? '',
        ),
        arguments: {
          ApiConstants.apiNavLink: widget.data.apiDetailUrl ?? '',
          ApiConstants.siteNavLink: widget.data.siteDetailUrl ?? '',
        },
      );
    } else {
      setState(
        () {
          _isButtonsVisible = !_isButtonsVisible;
        },
      );
    }
  }

  Widget _buildAnimatedButton(int index, Widget button) {
    return SizedBox(
      height: _isButtonsVisible ? null : 0,
      child: AnimatedOpacity(
        opacity: _isButtonsVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: button,
      ),
    );
  }
}
