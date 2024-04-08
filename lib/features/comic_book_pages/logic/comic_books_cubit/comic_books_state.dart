import 'package:freezed_annotation/freezed_annotation.dart';
part 'comic_books_state.freezed.dart';

@freezed
class ComicBooksState<T> with _$ComicBooksState {
  // general loading states
  const factory ComicBooksState.initial() = _Initial;
  const factory ComicBooksState.loading() = Loading;

  const factory ComicBooksState.success(T data) = Success;
  const factory ComicBooksState.loadingError(String error) = LoadingError;

  // for you issues states
  const factory ComicBooksState.forYouIssuesListLoading() =
      ForYouIssuesListLoading;
  const factory ComicBooksState.forYouIssuesListSuccess(T data) =
      ForYouIssuesListSuccess;
  const factory ComicBooksState.forYouIssuesListError(String error) =
      ForYouIssuesListError;

  // most recent volumes states
  const factory ComicBooksState.mostRecentVolumesListLoading() =
      MostRecentVolumesListLoading;
  const factory ComicBooksState.mostRecentVolumesListSuccess(T data) =
      MostRecentVolumesListSuccess;
  const factory ComicBooksState.mostRecentVolumesListError(String error) =
      MostRecentVolumesListError;

  // popular publishers states
  const factory ComicBooksState.popularPublishersListLoading() =
      PopularPublishersListLoading;
  const factory ComicBooksState.popularPublishersListSuccess(T data) =
      PopularPublishersListSuccess;
  const factory ComicBooksState.popularPublishersListError(String error) =
      PopularPublishersListError;
}
