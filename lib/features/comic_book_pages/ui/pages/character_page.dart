import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/character_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/credits_list.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/description_view_widget.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_blocbuilder.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CharacterPage extends StatefulWidget {
  final String issueLink;
  final String navigationLink;
  const CharacterPage({
    super.key,
    required this.issueLink,
    required this.navigationLink,
  });

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
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
    final characterModel = data as CharacterModel;
    var children = [
      Gap(15.px),
      Text(
        '${characterModel.name} ${characterModel.realName}',
        style: TextStyles.font15DynamicMedium,
      ),
      DescriptionViewWidget(description: characterModel.description),
      CreditsList(
        headerText: 'powers: ${characterModel.powers!.length}',
        creditsModelList: characterModel.powers,
      ),
      CreditsList(
        headerText: 'issues: ${characterModel.issueCredits!.length}',
        creditsModelList: characterModel.issueCredits,
      ),
      CreditsList(
        headerText: 'issues died in: ${characterModel.issuesDiedIn!.length}',
        creditsModelList: characterModel.issuesDiedIn,
      ),
      CreditsList(
        headerText: 'movies: ${characterModel.movies!.length}',
        creditsModelList: characterModel.movies,
      ),
      CreditsList(
        headerText: 'teams: ${characterModel.teams!.length}',
        creditsModelList: characterModel.teams,
      ),
      CreditsList(
        headerText: 'friends: ${characterModel.characterFriends!.length}',
        creditsModelList: characterModel.characterFriends,
      ),
      CreditsList(
        headerText: 'enemies: ${characterModel.characterEnemies!.length}',
        creditsModelList: characterModel.characterEnemies,
      ),
      CreditsList(
        headerText: 'Publisher',
        creditsModelList: [characterModel.publisher!],
      ),
    ];
    return ObjectContent(
      title: characterModel.name ?? '',
      commonDataModel: characterModel,
      backgroundImageUrl: characterModel.imageModel!.mediumUrl ?? '',
      children: children,
    );
  }

  @override
  void initState() {
    volumePageInitFunc();
    super.initState();
  }

  void volumePageInitFunc() {
    context
        .read<ComicBooksCubit>()
        .getCharacterFromCustomLink(widget.issueLink);
  }
}
