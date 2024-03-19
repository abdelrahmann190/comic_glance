import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_book_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicBooksGridView extends StatelessWidget {
  final List data;
  const ComicBooksGridView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}
