import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_library_state.freezed.dart';

@freezed
class MyLibraryState<T> with _$MyLibraryState {
  const factory MyLibraryState.initial() = _Initial;
  const factory MyLibraryState.loading() = Loading;
  const factory MyLibraryState.loadingSuccess(T data) = LoadingSuccess;
  const factory MyLibraryState.loadingError(String error) = LoadingError;
}
