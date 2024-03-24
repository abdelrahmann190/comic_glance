import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:hive/hive.dart';

class LocalDatabaseServices {
  final Box _favoritesBox = Hive.box(AppStrings.favorites);

  /// Get all items inside the box as a list of [CommonDataModel]
  Future<List<CommonDataModel>> getFavoritesList() async {
    return _favoritesBox.values
        .map((commonDataModel) => commonDataModel as CommonDataModel)
        .toList()
        .reversed
        .toList();
  }

  /// Add new item to the box
  Future<int> addFavoriteObject(CommonDataModel item) async {
    return await _favoritesBox.add(item);
  }

  /// remove a certain item inside the box
  Future<void> removeFavoriteObject(int? id) async {
    final index = addedItemIndex(id);
    await _favoritesBox.deleteAt(index);
  }

  /// Function to get the index of a certain item inside the box
  int addedItemIndex(int? id) {
    return _favoritesBox.values
        .toList()
        .indexWhere((commonDataModel) => commonDataModel.id == id);
  }
}
