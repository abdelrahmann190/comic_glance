import 'package:comic_glance/core/local_data_base/local_database_services.dart';
import 'package:comic_glance/core/networking/api_result.dart';
import 'package:comic_glance/core/networking/networking_error_handler.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';

class MyLibraryRepo {
  LocalDatabaseServices localDatabaseServices;
  MyLibraryRepo(this.localDatabaseServices);

  Future<ApiResult<List<CommonDataModel>>> getFavoritesList() async {
    try {
      final favoritesList = await localDatabaseServices.getFavoritesList();
      return ApiResult.success(favoritesList);
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult> addFavoriteObject(CommonDataModel item) async {
    try {
      localDatabaseServices.addFavoriteObject(item);
      return const ApiResult.success('');
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult> removeFavoriteObject(int? id) async {
    try {
      localDatabaseServices.removeFavoriteObject(id);
      return const ApiResult.success('');
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  bool isItemAdded(int? id) {
    try {
      final index = localDatabaseServices.addedItemIndex(id);

      return index == -1 ? false : true;
    } catch (error) {
      return false;
    }
  }
}
