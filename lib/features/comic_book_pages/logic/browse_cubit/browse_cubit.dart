import 'package:bloc/bloc.dart';
import 'package:comic_glance/features/comic_book_pages/data/repo/comic_books_repo.dart';
import 'package:comic_glance/features/comic_book_pages/logic/browse_cubit/browse_state.dart';
import 'package:flutter/material.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit(this._comicBooksRepo) : super(const BrowseState.initial());

  final ComicBooksRepo _comicBooksRepo;

  final searchController = TextEditingController();

  void emitSearchResult() async {
    emit(const BrowseState.loading());
    final result =
        await _comicBooksRepo.getSearchResults(searchController.text);
    result.when(
      success: (data) {
        emit(
          BrowseState.success(data),
        );
      },
      failure: (error) {
        emit(
          BrowseState.loadingError(
            error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}
