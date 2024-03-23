import 'package:comic_glance/core/widgets/custom_text_form_field.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:comic_glance/features/comic_book_pages/logic/browse_cubit/browse_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/browse_page_content.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/browse_results_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
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
              data: 'Browse',
            ),
            Gap(15.px),
            CustomTextFormField(
              hintText: 'Search',
              addClearButton: true,
              icon: Icons.search,
              controller: context.read<BrowseCubit>().searchController,
              isPasswordField: false,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<BrowseCubit>().emitSearchResult();
                }
              },
            ),
            const BrowseResultsFilter(),
            Gap(15.px),
            const Expanded(
              child: BrowsePageContent(),
            ),
          ],
        ),
      ),
    );
  }
}
