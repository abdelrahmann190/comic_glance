import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowMoreCard<T> extends StatelessWidget {
  final List<CommonDataModel> data;
  const ShowMoreCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        context.pushNamed(
          AppRoutes.showMorePage,
          arguments: data,
        );
      },
      child: Container(
        width: 160.px,
        height: 230.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.px),
          color: context.appTheme.primaryColor.withOpacity(0.1),
        ),
        child: const Center(
          child: Text(
            'Show more',
          ),
        ),
      ),
    );
  }
}
