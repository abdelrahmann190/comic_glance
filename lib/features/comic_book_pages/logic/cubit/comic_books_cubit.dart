// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:comic_glance/features/comic_book_pages/data/repo/comic_books_repo.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_state.dart';

class ComicBooksCubit extends Cubit<ComicBooksState> {
  final ComicBooksRepo _comicBooksRepo;
  ComicBooksCubit(
    this._comicBooksRepo,
  ) : super(
          const ComicBooksState.initial(),
        );

  void getForYouIssuesList() async {
    emit(const ComicBooksState.loading());
    final result = await _comicBooksRepo.getIssuesList();

    result.when(
      success: (data) {
        emit(
          ComicBooksState.success(data),
        );
      },
      failure: (error) {
        emit(
          ComicBooksState.loadingError(error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void getMostRecentVolumesList() async {
    emit(const ComicBooksState.loading());
    final result = await _comicBooksRepo.getMostRecentVolumesList();

    result.when(
      success: (data) {
        emit(
          ComicBooksState.success(data),
        );
      },
      failure: (error) {
        emit(
          ComicBooksState.loadingError(error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void getPopularPublishersList() async {
    emit(const ComicBooksState.loading());
    final result = await _comicBooksRepo.getPopularPublishersList();

    result.when(
      success: (data) {
        emit(
          ComicBooksState.success(data),
        );
      },
      failure: (error) {
        emit(
          ComicBooksState.loadingError(error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void getIssueFromCustomLink(
    String customLink,
  ) async {
    emit(
      const ComicBooksState.loading(),
    );
    final result = await _comicBooksRepo.getIssueFromCustomLink(customLink);
    result.when(
      success: (data) {
        emit(
          ComicBooksState.success(data),
        );
      },
      failure: (error) {
        emit(
          ComicBooksState.loadingError(error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
