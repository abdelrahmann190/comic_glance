import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:hive/hive.dart';

class LocalDatabaseServices {
  final Box _box = Hive.box(AppStrings.favorites);
  Future<List<CommonDataModel>> getFavoritesList() async {
    return _box.values
        .map((commonDataModel) => commonDataModel as CommonDataModel)
        .toList();
  }

  Future<int> addFavoriteObject(CommonDataModel item) async {
    return await _box.add(item);
  }

  Future<void> removeFavoriteObject(int? id) async {
    final index = addedItemIndex(id);
    await _box.deleteAt(index);
  }

  int addedItemIndex(int? id) {
    return _box.values.toList().indexWhere((e) => e.id == id);
  }
}
