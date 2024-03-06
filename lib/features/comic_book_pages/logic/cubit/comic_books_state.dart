import 'package:freezed_annotation/freezed_annotation.dart';
part 'comic_books_state.freezed.dart';

@freezed
class ComicBooksState<T> with _$ComicBooksState {
  const factory ComicBooksState.initial() = _Initial;
  const factory ComicBooksState.loading() = Loading;
  const factory ComicBooksState.success(T data) = Success;
  const factory ComicBooksState.loadingError(String error) = LoadingError;
}
