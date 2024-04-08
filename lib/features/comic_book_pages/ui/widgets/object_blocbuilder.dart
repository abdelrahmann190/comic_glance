import 'package:comic_glance/core/widgets/loading_widget.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObjectBlocbuilder extends StatelessWidget {
  final Widget? Function(dynamic)? successFunction;
  const ObjectBlocbuilder({
    super.key,
    required this.successFunction,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBooksCubit, ComicBooksState>(
      builder: (context, state) {
        return state.whenOrNull(
              loading: () {
                return const Center(child: LoadingWidget());
              },
              success: successFunction,
              loadingError: (error) {
                return Container();
              },
            ) ??
            const SizedBox.shrink();
      },
    );
  }
}
