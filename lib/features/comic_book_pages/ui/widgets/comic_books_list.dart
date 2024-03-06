import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_state.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_book_card.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/show_more_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicBooksList extends StatelessWidget {
  const ComicBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBooksCubit, ComicBooksState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is LoadingError,
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          loading: () {
            return const Center(child: LoadingWidget());
          },
          success: (data) {
            return buildSuccessSection(data as List<CommonDataModel>);
          },
          loadingError: (error) {
            return Text(error);
          },
        );
      },
    );
  }

  SizedBox buildSuccessSection(List<CommonDataModel> data) {
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
                  data: data,
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
