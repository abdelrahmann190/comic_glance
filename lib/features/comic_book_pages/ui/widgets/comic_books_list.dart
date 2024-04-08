import 'package:comic_glance/core/helpers/enums.dart';
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_state.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_book_card.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/show_more_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicBooksList extends StatelessWidget {
  final HomeScreenState loadWhenState;
  const ComicBooksList({super.key, required this.loadWhenState});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBooksCubit, ComicBooksState>(
      buildWhen: buildWhenFunction,
      builder: (context, state) {
        return state.whenOrNull(
              loading: buildLoadingSection,
              forYouIssuesListLoading: buildLoadingSection,
              mostRecentVolumesListLoading: buildLoadingSection,
              popularPublishersListLoading: buildLoadingSection,
              success: buildSuccessSection,
              forYouIssuesListSuccess: buildSuccessSection,
              mostRecentVolumesListSuccess: buildSuccessSection,
              popularPublishersListSuccess: buildSuccessSection,
              loadingError: buildErrorSection,
              forYouIssuesListError: buildErrorSection,
              mostRecentVolumesListError: buildErrorSection,
              popularPublishersListError: buildErrorSection,
            ) ??
            const SizedBox.shrink();
      },
    );
  }

  bool buildWhenFunction(previous, current) {
    if (loadWhenState == HomeScreenState.issuesForYou) {
      return current is ForYouIssuesListLoading ||
          current is ForYouIssuesListSuccess ||
          current is ForYouIssuesListError;
    } else if (loadWhenState == HomeScreenState.mostRecentVolumes) {
      return current is MostRecentVolumesListLoading ||
          current is MostRecentVolumesListSuccess ||
          current is MostRecentVolumesListError;
    } else if (loadWhenState == HomeScreenState.popularPublishers) {
      return current is PopularPublishersListLoading ||
          current is PopularPublishersListSuccess ||
          current is PopularPublishersListError;
    } else {
      return false;
    }
  }

  Widget? buildErrorSection(error) {
    return Text(error);
  }

  Widget? buildLoadingSection() {
    return const Center(child: LoadingWidget());
  }

  SizedBox buildSuccessSection(data) {
    return SizedBox(
      height: 300.px,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 14) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ComicBookCard(
                  data: data[index],
                ),
                Gap(15.px),
                ShowMoreCard(
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.showMorePage,
                      arguments: data,
                    );
                  },
                  width: 160.px,
                  height: 230.px,
                ),
              ],
            );
          }
          return Container(
            margin: EdgeInsets.only(right: 15.px),
            child: ComicBookCard(
              data: data[index],
            ),
          );
        },
      ),
    );
  }
}
