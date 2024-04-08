import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/volume_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/credits_list.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/description_view_widget.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_blocbuilder.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/object_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VolumePage extends StatefulWidget {
  final String issueLink;
  final String navigationLink;
  const VolumePage({
    super.key,
    required this.issueLink,
    required this.navigationLink,
  });

  @override
  State<VolumePage> createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
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
    final volumeModel = data as VolumeModel;
    var children = [
      Gap(15.px),
      Text(
        volumeModel.name ?? '',
        style: TextStyles.font15DynamicMedium,
      ),
      DescriptionViewWidget(description: volumeModel.description),
      CreditsList(
        headerText:
            'issues: ${volumeModel.issues != null ? volumeModel.issues!.length : ''}',
        creditsModelList: volumeModel.issues,
      ),
      CreditsList(
        headerText:
            'characters: ${volumeModel.characters != null ? volumeModel.characters!.length : ''}',
        creditsModelList: volumeModel.characters,
      ),
      CreditsList(
        headerText:
            'Locations: ${volumeModel.locations != null ? volumeModel.locations!.length : ''}',
        creditsModelList: volumeModel.locations,
      ),
      CreditsList(
        headerText:
            'people: ${volumeModel.people != null ? volumeModel.people!.length : ''}',
        creditsModelList: volumeModel.people,
      ),
      CreditsList(
        headerText: 'Publisher',
        creditsModelList: [volumeModel.publisher!],
      ),
    ];
    return ObjectContent(
      title: volumeModel.name ?? '',
      commonDataModel: volumeModel.commonDataModel,
      backgroundImageUrl: volumeModel.imageModel!.mediumUrl ?? '',
      children: children,
    );
  }

  @override
  void initState() {
    volumePageInitFunc();
    super.initState();
  }

  void volumePageInitFunc() {
    context.read<ComicBooksCubit>().getVolumeFromCustomLink(widget.issueLink);
  }
}
