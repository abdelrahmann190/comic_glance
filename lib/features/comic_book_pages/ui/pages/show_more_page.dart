import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_books_grid_view.dart';
import 'package:flutter/material.dart';

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
        child: ComicBooksGridView(
          data: data,
          key: key,
        ),
      ),
    );
  }
}
