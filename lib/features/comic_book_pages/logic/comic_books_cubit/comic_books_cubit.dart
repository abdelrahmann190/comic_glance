// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:comic_glance/core/networking/api_result.dart';

import 'package:comic_glance/features/comic_book_pages/data/repo/comic_books_repo.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_state.dart';

class ComicBooksCubit extends Cubit<ComicBooksState> {
  final ComicBooksRepo _comicBooksRepo;
  ComicBooksCubit(
    this._comicBooksRepo,
  ) : super(
          const ComicBooksState.initial(),
        );

  void getForYouIssuesList() async {
    emit(const ComicBooksState.forYouIssuesListLoading());
    final result = await _comicBooksRepo.getIssuesList();

    result.when(
      success: (data) {
        emit(
          ComicBooksState.forYouIssuesListSuccess(data),
        );
      },
      failure: (error) {
        emit(
          ComicBooksState.forYouIssuesListError(
              error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void getMostRecentVolumesList() async {
    emit(const ComicBooksState.mostRecentVolumesListLoading());
    final result = await _comicBooksRepo.getMostRecentVolumesList();

    result.when(
      success: (data) {
        emit(
          ComicBooksState.mostRecentVolumesListSuccess(data),
        );
      },
      failure: (error) {
        emit(
          ComicBooksState.mostRecentVolumesListError(
              error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void getPopularPublishersList() async {
    emit(const ComicBooksState.popularPublishersListLoading());
    final result = await _comicBooksRepo.getPopularPublishersList();

    result.when(
      success: (data) {
        emit(
          ComicBooksState.popularPublishersListSuccess(data),
        );
      },
      failure: (error) {
        emit(
          ComicBooksState.popularPublishersListError(
              error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void getVolumeFromCustomLink(
    String customLink,
  ) async {
    _emitDataFromCustomLink(
        _comicBooksRepo.getVolumeFromCustomLink(customLink));
  }

  void getIssueFromCustomLink(
    String customLink,
  ) async {
    _emitDataFromCustomLink(_comicBooksRepo.getIssueFromCustomLink(customLink));
  }

  void getCharacterFromCustomLink(
    String customLink,
  ) async {
    _emitDataFromCustomLink(
        _comicBooksRepo.getCharacterFromCustomLink(customLink));
  }

  void getPublisherFromCustomLink(
    String customLink,
  ) async {
    _emitDataFromCustomLink(
        _comicBooksRepo.getPublisherFromCustomLink(customLink));
  }

  void getMovieFromCustomLink(
    String customLink,
  ) async {
    _emitDataFromCustomLink(_comicBooksRepo.getMovieFromCustomLink(customLink));
  }

  void _emitDataFromCustomLink(Future<ApiResult> futureResult) async {
    emit(
      const ComicBooksState.loading(),
    );
    final result = await futureResult;
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
