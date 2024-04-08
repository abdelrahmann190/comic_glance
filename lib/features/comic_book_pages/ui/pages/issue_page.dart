import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';

import 'package:comic_glance/features/comic_book_pages/ui/widgets/credits_list.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/description_view_widget.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_blocbuilder.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:comic_glance/features/comic_book_pages/data/models/issue_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';

class IssuePage extends StatefulWidget {
  final String issueLink;
  final String navigationLink;
  const IssuePage({
    Key? key,
    required this.issueLink,
    required this.navigationLink,
  }) : super(key: key);

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
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
    final issueModel = data as IssueModel;
    return ObjectContent(
      title: 'Issue #${issueModel.issueNumber ?? ''}',
      commonDataModel: issueModel,
      backgroundImageUrl: '${issueModel.imageModel!.mediumUrl}',
      children: getBodyWidgets(issueModel),
    );
  }

  List<Widget> getBodyWidgets(IssueModel issueModel) {
    return [
      Gap(15.px),
      Text(
        '${issueModel.name ?? issueModel.volume!.name ?? ''}, Issue: #${issueModel.issueNumber ?? ''}',
        style: TextStyles.font15DynamicMedium,
      ),
      DescriptionViewWidget(description: issueModel.description),
      CreditsList(
        headerText: 'Volume',
        creditsModelList: [issueModel.volume!],
      ),
      CreditsList(
        headerText:
            'Characters: ${issueModel.characterCredits != null ? issueModel.characterCredits!.length : ''}',
        creditsModelList: issueModel.characterCredits,
      ),
      CreditsList(
        headerText:
            'Teams Involved: ${issueModel.teamCredits != null ? issueModel.teamCredits!.length : ''}',
        creditsModelList: issueModel.teamCredits,
      ),
      CreditsList(
        headerText:
            'Story Arcs: ${issueModel.storyArcCredits != null ? issueModel.storyArcCredits!.length : ''}',
        creditsModelList: issueModel.storyArcCredits,
      ),
      CreditsList(
        headerText:
            'Locations: ${issueModel.locationCredits != null ? issueModel.locationCredits!.length : ''}',
        creditsModelList: issueModel.locationCredits,
      ),
      CreditsList(
        headerText:
            'Concepts: ${issueModel.conceptCredits != null ? issueModel.conceptCredits!.length : ''}',
        creditsModelList: issueModel.conceptCredits,
      ),
      CreditsList(
        headerText:
            'Creators: ${issueModel.personCredits != null ? issueModel.personCredits!.length : ''}',
        creditsModelList: issueModel.personCredits,
      ),
    ];
  }

  bool checkIfItemIsAdded(int id) {
    return context.read<MyLibraryCubit>().isItemAdded(id);
  }

  @override
  void initState() {
    context.read<ComicBooksCubit>().getIssueFromCustomLink(widget.issueLink);

    super.initState();
  }
}
