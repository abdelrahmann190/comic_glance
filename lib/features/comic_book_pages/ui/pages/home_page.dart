import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/theming/theme_controller.dart';
import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_cubit.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/comic_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  final themeController = getItInstance<ThemeController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(
              seconds: 2,
            ),
          );
        },
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.px,
            vertical: 10.px,
          ),
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MainPageHeaderText(
                  data: AppStrings.comicGlance,
                ),
                CircleAvatar(
                  backgroundColor: context.appTheme.splashColor,
                  child: SvgPicture.asset(
                    'assets/icons/home_pressed_icon.svg',
                  ),
                ),
              ],
            ),
            Gap(15.px),
            const BodyHeaderText(
              data: 'Issues for you',
            ),
            Gap(15.px),
            BlocProvider(
              create: (context) =>
                  getItInstance<ComicBooksCubit>()..getForYouIssuesList(),
              child: const ComicBooksList(),
            ),
            Gap(15.px),
            const BodyHeaderText(
              data: 'Most recent volumes',
            ),
            Gap(15.px),
            BlocProvider(
              create: (context) =>
                  getItInstance<ComicBooksCubit>()..getMostRecentVolumesList(),
              child: const ComicBooksList(),
            ),
            Gap(15.px),
            const BodyHeaderText(
              data: 'Popular publishers',
            ),
            Gap(15.px),
            BlocProvider(
              create: (context) =>
                  getItInstance<ComicBooksCubit>()..getPopularPublishersList(),
              child: const ComicBooksList(),
            ),
          ],
        ),
      ),
    );
  }
}
