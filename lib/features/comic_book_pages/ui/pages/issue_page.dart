import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_glance/core/helpers/html_handler.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/comic_book_pages/ui/widgets/credits_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:comic_glance/features/comic_book_pages/data/models/issue_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.px,
            vertical: 10.px,
          ),
          child: BlocBuilder<ComicBooksCubit, ComicBooksState>(
            builder: (context, state) {
              return state.whenOrNull(
                    loading: () {
                      return const Center(child: LoadingWidget());
                    },
                    success: buildSuccessSection,
                    loadingError: (error) {
                      // return ViewLinkWidget(
                      //   navigationLink: widget.navigationLink,
                      //   controller: controller,
                      // );
                      return Container();
                    },
                  ) ??
                  const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget buildSuccessSection(data) {
    final issueModel = data as IssueModel;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.px,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: issueModel.imageModel.mediumUrl ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Gap(15.px),
              Text(
                '${issueModel.name ?? issueModel.volume!['name']}, Issue: #${issueModel.issueNumber}',
                style: TextStyles.font15DynamicMedium,
              ),
              Gap(30.px),
              const BodyHeaderText(data: 'Describtion'),
              Gap(15.px),
              BodyHeaderTextMedium(
                  data: HtmlHandler.turnHtmlTextToString(
                      issueModel.description ?? '')),
              CreditsList(
                  headerText: 'Characters',
                  creditsModelList: issueModel.characterCreditsMapped),
              CreditsList(
                  headerText: 'Teams Involved',
                  creditsModelList: issueModel.teamCreditsMapped),
            ],
          ),
        )
      ],
    );
  }

  String? imageString;

  @override
  void initState() {
    context.read<ComicBooksCubit>().getIssueFromCustomLink(widget.issueLink);
    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(Colors.black)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.contains('4005')) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse(widget.navigationLink));

    super.initState();
  }
}
