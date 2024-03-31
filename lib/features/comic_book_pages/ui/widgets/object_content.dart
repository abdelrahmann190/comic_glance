import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/core/widgets/custom_circle_button.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/card_cover_image.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ObjectContent extends StatefulWidget {
  final String title;
  final String backgroundImageUrl;
  final List<Widget> children;
  final CommonDataModel? commonDataModel;
  const ObjectContent({
    super.key,
    required this.title,
    required this.backgroundImageUrl,
    required this.children,
    required this.commonDataModel,
  });

  @override
  State<ObjectContent> createState() => _ObjectContentState();
}

class _ObjectContentState extends State<ObjectContent> {
  late bool _isItemAdded;
  late ValueNotifier<bool> itemAddedNotifier;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.appCustomTheme.scaffoldBackgroundColor,
          actions: [
            FavoriteButton(
              isItemAddedNotifier: itemAddedNotifier,
              onPressed: () {
                if (_isItemAdded) {
                  context
                      .read<MyLibraryCubit>()
                      .removeFavoriteObject(widget.commonDataModel!.id)
                      .then((value) {
                    _isItemAdded = !_isItemAdded;
                    itemAddedNotifier.value = _isItemAdded;
                  });
                } else {
                  context
                      .read<MyLibraryCubit>()
                      .addFavoriteObject(widget.commonDataModel!)
                      .then((value) {
                    _isItemAdded = !_isItemAdded;
                    itemAddedNotifier.value = _isItemAdded;
                  });
                }
              },
            ),
            const Gap(5),
          ],
          elevation: 0,
          leading: CustomCircleButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              context.pop();
            },
            backgroundColor:
                context.appCustomTheme.scaffoldBackgroundColor.withOpacity(0.7),
          ),
          expandedHeight: 300.px,
          pinned: true,
          scrolledUnderElevation: 0,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              constraints: BoxConstraints.loose(Size(55.w, 60)),
              padding: EdgeInsets.all(5.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.px),
                color: context.appCustomTheme.primaryColor.withOpacity(0.7),
              ),
              child: BodyHeaderText(
                data: widget.title,
                textColor: context.appCustomTheme.canvasColor,
              ),
            ),
            background: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: CardCoverImage(
                        imageUrl: widget.backgroundImageUrl,
                      ),
                    );
                  },
                );
              },
              child: CardCoverImage(
                imageUrl: widget.backgroundImageUrl,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            widget.children,
          ),
        ),
      ],
    );
  }

  bool checkIfItemIsAdded() {
    return context
        .read<MyLibraryCubit>()
        .isItemAdded(widget.commonDataModel!.id);
  }

  @override
  void initState() {
    _isItemAdded = checkIfItemIsAdded();
    itemAddedNotifier = ValueNotifier(_isItemAdded);
    super.initState();
  }
}
