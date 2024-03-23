import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_state.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_books_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({super.key});

  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.px,
          vertical: 10.px,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainPageHeaderText(
              data: 'My Library',
            ),
            Gap(15.px),
            Expanded(
              child: BlocBuilder<MyLibraryCubit, MyLibraryState>(
                buildWhen: (previous, current) {
                  if (current is Loading ||
                      current is LoadingSuccess ||
                      current is LoadingError) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return state.whenOrNull(
                        loading: () {
                          return const LoadingWidget();
                        },
                        loadingSuccess: (data) {
                          return ComicBooksGridView(data: data);
                        },
                        loadingError: (error) {
                          return Text(error);
                        },
                      ) ??
                      const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<MyLibraryCubit>().getFavoritesList();
    super.initState();
  }
}
