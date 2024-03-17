import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_book_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowMorePage extends StatelessWidget {
  final List<CommonDataModel> data;
  const ShowMorePage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appCustomTheme.scaffoldBackgroundColor,
        title: const Text('Show All'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 15.px,
            vertical: 10.px,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300.px,
            crossAxisSpacing: 30.px,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ComicBookCard(
              data: data[index],
            );
          },
        ),
      ),
    );
  }
}
