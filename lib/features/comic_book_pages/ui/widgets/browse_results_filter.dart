import 'package:chips_choice/chips_choice.dart';
import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:comic_glance/features/comic_book_pages/logic/browse_cubit/browse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseResultsFilter extends StatefulWidget {
  const BrowseResultsFilter({Key? key}) : super(key: key);

  @override
  State<BrowseResultsFilter> createState() => _BrowseResultsFilterState();
}

class _BrowseResultsFilterState extends State<BrowseResultsFilter> {
  List<String> tags = [
    AppStrings.browseFilters[0],
  ];
  bool isWrapped = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ChipsChoice<String>.multiple(
            value: tags,
            wrapped: isWrapped,
            onChanged: onChangedFunction,
            choiceStyle: C2ChipStyle.filled(
              borderRadius: BorderRadius.circular(30),
            ),
            choiceItems: C2Choice.listFrom<String, String>(
              source: AppStrings.browseFilters,
              value: (i, v) => v,
              label: (i, v) => v,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isWrapped = !isWrapped;
            });
          },
          icon: Icon(
            isWrapped
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
          ),
        ),
      ],
    );
  }

  void onChangedFunction(List<String> values) {
    if (values.isEmpty) {
      context.read<BrowseCubit>().searchFilters = [''];
      setState(() {
        tags = [
          AppStrings.browseFilters[0],
        ];
      });
    } else {
      if (values.contains(AppStrings.browseFilters[0])) {
        values = whenTheAllButtonIsPressed(values);
      } else {
        context.read<BrowseCubit>().searchFilters = values;
      }
      setState(() {
        tags = values;
      });
    }
  }

  /// When the 'All' button is pressed, the list of filters is reset to 'All'.
  List<String> whenTheAllButtonIsPressed(List<String> values) {
    if (values.length > 2 || values.first != AppStrings.browseFilters[0]) {
      values = [
        AppStrings.browseFilters[0],
      ];
      context.read<BrowseCubit>().searchFilters = [''];
    } else {
      values.removeAt(0);
      context.read<BrowseCubit>().searchFilters = values;
    }
    return values;
  }
}
