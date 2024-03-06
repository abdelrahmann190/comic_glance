// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      onTap: cardOnTapFunction,
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160.px,
                  height: 230.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.data.imageModel.mediumUrl ?? '',
                      ),
                      colorFilter: _isButtonsVisible
                          ? const ColorFilter.mode(
                              Colors.black38,
                              BlendMode.darken,
                            )
                          : null,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: buildImageContainerChild(),
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

  Widget buildImageContainerChild() {
    return Container();
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: List.generate(
    //     widget.buttons.length,
    //     (index) => _buildAnimatedButton(
    //       index,
    //       widget.buttons[index],
    //     ),
    //   ),
    // );
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
