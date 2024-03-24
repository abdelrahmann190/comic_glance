// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_glance/core/helpers/date_time_helper.dart';
import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool _isItemAdded = false;

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
                        borderRadius: BorderRadius.circular(15.px),
                        child: CachedNetworkImage(
                          imageUrl: widget.data.imageModel.thumbUrl ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.all(5.px),
                      width: 160.px,
                      height: _isButtonsVisible ? 230.px : 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.px),
                        color: Colors.black26,
                      ),
                      child: buildAnimatedButton(),
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
          _isItemAdded = checkIfItemIsAdded();
        },
      );
    }
  }

  Widget buildAnimatedButton() {
    return Opacity(
      opacity: _isButtonsVisible ? 1 : 0,
      child: FavoriteButton(
        isItemAdded: _isItemAdded,
        onPressed: onFavoriteButtonPressed,
      ),
    );
  }

  void onFavoriteButtonPressed() {
    if (_isItemAdded) {
      context.read<MyLibraryCubit>().removeFavoriteObject(widget.data.id).then(
        (value) {
          if (!checkIfItemIsAdded()) {
            setIsItemAddedValue();
          }
        },
      );
    } else {
      context.read<MyLibraryCubit>().addFavoriteObject(widget.data).then(
        (value) {
          if (checkIfItemIsAdded()) {
            setIsItemAddedValue();
          }
        },
      );
    }
  }

  void setIsItemAddedValue() {
    return setState(
      () {
        _isItemAdded = !_isItemAdded;
        _isButtonsVisible = !_isButtonsVisible;
      },
    );
  }

  bool checkIfItemIsAdded() {
    return context.read<MyLibraryCubit>().isItemAdded(widget.data.id);
  }

  @override
  void initState() {
    _isItemAdded = checkIfItemIsAdded();
    super.initState();
  }
}
