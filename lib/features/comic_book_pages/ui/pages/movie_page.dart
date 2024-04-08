import 'package:comic_glance/core/helpers/date_time_helper.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/movie_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';

import 'package:comic_glance/features/comic_book_pages/ui/widgets/credits_list.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/description_view_widget.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_blocbuilder.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_content.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/single_line_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';

class MoviePage extends StatefulWidget {
  final String issueLink;
  final String navigationLink;
  const MoviePage({
    Key? key,
    required this.issueLink,
    required this.navigationLink,
  }) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.px,
            vertical: 10.px,
          ),
          child: ObjectBlocbuilder(successFunction: buildSuccessSection),
        ),
      ),
    );
  }

  Widget buildSuccessSection(data) {
    final movieModel = data as MovieModel;
    return ObjectContent(
      title: movieModel.name ?? '',
      commonDataModel: movieModel,
      backgroundImageUrl: '${movieModel.imageModel!.mediumUrl}',
      children: getBodyWidgets(movieModel),
    );
  }

  List<Widget> getBodyWidgets(MovieModel movieModel) {
    return [
      Gap(15.px),
      Text(
        movieModel.name ?? movieModel.name ?? '',
        style: TextStyles.font15DynamicMedium,
      ),
      SingleLineInfo(title: 'Rating:', data: movieModel.rating),
      SingleLineInfo(title: 'Budget:', data: movieModel.budget),
      SingleLineInfo(title: 'Budget:', data: movieModel.boxOfficeRevenue),
      SingleLineInfo(title: 'Total revenue:', data: movieModel.totalRevenue),
      SingleLineInfo(
          title: 'Release date:',
          data: DateTimeHelper.formateYMD(movieModel.releaseDate!)),
      DescriptionViewWidget(description: movieModel.description),
      CreditsList(
        headerText: 'studios',
        creditsModelList: movieModel.studios,
      ),
      CreditsList(
        headerText: 'producers',
        creditsModelList: movieModel.producers,
      ),
      CreditsList(
        headerText: 'writers',
        creditsModelList: movieModel.writers,
      ),
    ];
  }

  bool checkIfItemIsAdded(int id) {
    return context.read<MyLibraryCubit>().isItemAdded(id);
  }

  @override
  void initState() {
    context.read<ComicBooksCubit>().getMovieFromCustomLink(widget.issueLink);

    super.initState();
  }
}
