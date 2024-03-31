import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/credit_view_card.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/show_more_card.dart';
import 'package:flutter/cupertino.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30.px),
            BodyHeaderText(
              data: widget.headerText.capitalize(),
            ),
            Gap(15.px),
            SizedBox(
              height: 190.px,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _creditsModelList.length <= 9
                    ? _creditsModelList.length
                    : 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 190.px,
                          child: CreditViewCard(
                            creditsModel: _creditsModelList[index],
                          ),
                        ),
                        ShowMoreCard(
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.showMoreCreditsPage,
                              arguments: widget.creditsModelList,
                            );
                          },
                          width: 100.px,
                          height: 120..px,
                        ),
                      ],
                    );
                  }
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
