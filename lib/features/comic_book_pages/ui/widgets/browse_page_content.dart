import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/comic_book_pages/logic/browse_cubit/browse_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/browse_cubit/browse_state.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_books_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowsePageContent extends StatelessWidget {
  const BrowsePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCubit, BrowseState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          loading: buildLoadingSection,
          success: buildSuccessSection,
          loadingError: buildErrorSection,
        );
      },
    );
  }

  Widget buildLoadingSection() {
    return const Center(child: LoadingWidget());
  }

  Widget buildSuccessSection(dynamic data) {
    return ComicBooksGridView(data: data);
  }

  Widget buildErrorSection(error) {
    return Text(error);
  }
}
