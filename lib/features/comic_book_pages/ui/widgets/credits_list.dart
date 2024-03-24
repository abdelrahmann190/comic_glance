import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/credit_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreditsList extends StatefulWidget {
  final List<CreditsModel>? creditsModelList;
  final String headerText;
  const CreditsList({
    super.key,
    required this.creditsModelList,
    required this.headerText,
  });

  @override
  State<CreditsList> createState() => _CreditsListState();
}

class _CreditsListState extends State<CreditsList> {
  List<CreditsModel> _creditsModelList = [];
  @override
  Widget build(BuildContext context) {
    if (_creditsModelList.isNotEmpty) {
      return SizedBox(
        height: 230.px,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30.px),
            BodyHeaderText(data: widget.headerText),
            Gap(15.px),
            Expanded(
              child: ListView.builder(
                itemCount: _creditsModelList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CreditViewCard(
                    creditsModel: _creditsModelList[index],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  void initState() {
    _creditsModelList = widget.creditsModelList ?? [];
    super.initState();
  }
}
