import 'package:freezed_annotation/freezed_annotation.dart';
part 'browse_state.freezed.dart';

@freezed
class BrowseState<T> with _$BrowseState {
  const factory BrowseState.initial() = _Initial;
  const factory BrowseState.loading() = Loading;
  const factory BrowseState.success(T data) = Success;
  const factory BrowseState.loadingError(String error) = LoadingError;
}
