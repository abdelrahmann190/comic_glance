import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:comic_glance/features/comic_book_pages/data/models/issue_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_state.dart';
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
              return state.when(
                initial: () {
                  return const SizedBox.shrink();
                },
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
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildSuccessSection(data) {
    final issueModel = data as IssueModel;
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              data.imageModel.mediumUrl ?? '',
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  issueModel.name ?? issueModel.volume!['name'],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
