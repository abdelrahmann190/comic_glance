import 'package:bloc/bloc.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/repo/my_library_repo.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_state.dart';

class MyLibraryCubit extends Cubit<MyLibraryState> {
  MyLibraryCubit(this.myLibraryRepo) : super(const MyLibraryState.initial());

  MyLibraryRepo myLibraryRepo;

  void getFavoritesList() async {
    emit(
      const MyLibraryState.loading(),
    );
    final result = await myLibraryRepo.getFavoritesList();
    result.when(
      success: (data) {
        emit(
          MyLibraryState.loadingSuccess(data),
        );
      },
      failure: (error) {
        emit(
          MyLibraryState.loadingError(error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  Future<void> addFavoriteObject(CommonDataModel item) async {
    final result = await myLibraryRepo.addFavoriteObject(item);
    result.when(
      success: (data) {
        getFavoritesList();
        emit(
          const MyLibraryState.itemAdded(true),
        );
      },
      failure: (error) {
        emit(
          const MyLibraryState.itemAdded(false),
        );
      },
    );
  }

  Future<void> removeFavoriteObject(int? id) async {
    final result = await myLibraryRepo.removeFavoriteObject(id);
    result.when(
      success: (data) {
        getFavoritesList();
      },
      failure: (error) {
        emit(
          const MyLibraryState.itemAdded(false),
        );
      },
    );
  }

  bool isItemAdded(int? id) {
    return myLibraryRepo.isItemAdded(id);
  }
}
