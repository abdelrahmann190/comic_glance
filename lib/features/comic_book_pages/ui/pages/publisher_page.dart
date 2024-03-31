import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/publisher_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/credits_list.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/description_view_widget.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_blocbuilder.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PublisherPage extends StatefulWidget {
  final String issueLink;
  final String navigationLink;
  const PublisherPage({
    super.key,
    required this.issueLink,
    required this.navigationLink,
  });

  @override
  State<PublisherPage> createState() => _PublisherPageState();
}

class _PublisherPageState extends State<PublisherPage> {
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
    final publisherModel = data as PublisherModel;
    var children = [
      Gap(15.px),
      Text(
        '${publisherModel.name} / ${publisherModel.locationCity}',
        style: TextStyles.font15DynamicMedium,
      ),
      DescriptionViewWidget(description: publisherModel.description),
      CreditsList(
        headerText: 'characters: ${publisherModel.characters!.length}',
        creditsModelList: publisherModel.characters,
      ),
      CreditsList(
        headerText: 'volumes: ${publisherModel.volumes!.length}',
        creditsModelList: publisherModel.volumes,
      ),
      CreditsList(
        headerText: 'teams: ${publisherModel.teams!.length}',
        creditsModelList: publisherModel.teams,
      ),
    ];
    return ObjectContent(
      title: publisherModel.name ?? '',
      commonDataModel: publisherModel,
      backgroundImageUrl: publisherModel.imageModel!.mediumUrl ?? '',
      children: children,
    );
  }

  @override
  void initState() {
    publisherPageInitFunc();
    super.initState();
  }

  void publisherPageInitFunc() {
    context
        .read<ComicBooksCubit>()
        .getPublisherFromCustomLink(widget.issueLink);
  }
}
