import 'package:comic_glance/core/helpers/app_shared_preferences.dart';
import 'package:comic_glance/core/local_data_base/local_database_services.dart';
import 'package:comic_glance/core/networking/api_services.dart';
import 'package:comic_glance/core/networking/app_auth_services.dart';
import 'package:comic_glance/core/networking/connection_checker.dart';
import 'package:comic_glance/core/networking/dio_factory.dart';
import 'package:comic_glance/core/theming/theme_controller.dart';
import 'package:comic_glance/core/theming/theme_service.dart';
import 'package:comic_glance/features/comic_book_pages/data/repo/comic_books_repo.dart';
import 'package:comic_glance/features/comic_book_pages/data/repo/my_library_repo.dart';
import 'package:comic_glance/features/comic_book_pages/logic/browse_cubit/browse_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';
import 'package:comic_glance/features/login/data/repos/login_repo.dart';
import 'package:comic_glance/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getItInstance = GetIt.instance;

class GetitDI {
  static Future<void> init() async {
    /// Theme controller injections
    getItInstance.registerLazySingleton(
      () => ThemeService(
        getItInstance(),
      ),
    );

    getItInstance.registerLazySingleton(
      () => ThemeController(
        getItInstance(),
      ),
    );

    /// Shared Preferences
    final sharedPreferences = await SharedPreferences.getInstance();
    getItInstance.registerLazySingleton(
      () => sharedPreferences,
    );

    /// internet checker package
    getItInstance.registerLazySingleton(
      () => InternetConnection(),
    );

    /// Connection checker
    getItInstance.registerLazySingleton(
      () => ConnectionChecker(
        getItInstance(),
      ),
    );

    /// App Shared Preferenecse
    getItInstance.registerLazySingleton(
      () => AppSharedPrefereneces(
        getItInstance(),
      ),
    );

    /// Api Service
    getItInstance.registerLazySingleton(
      () => ComicGlanceApiService(
        DioFactory.getDio(),
      ),
    );

    /// Comic books api repo
    getItInstance.registerLazySingleton(
      () => ComicBooksRepo(
        getItInstance(),
      ),
    );

    /// Comic books cubit
    getItInstance.registerFactory(
      () => ComicBooksCubit(
        getItInstance(),
      ),
    );

    /// Browse cubit
    getItInstance.registerFactory(
      () => BrowseCubit(
        getItInstance(),
      ),
    );

    /// Local database services
    getItInstance.registerFactory(
      () => LocalDatabaseServices(),
    );

    /// My Library repo
    getItInstance.registerFactory(
      () => MyLibraryRepo(
        getItInstance(),
      ),
    );

    /// My Library cubit
    getItInstance.registerLazySingleton(
      () => MyLibraryCubit(
        getItInstance(),
      ),
    );

    /// Auth services
    getItInstance.registerFactory(
      () => AppAuthServices(),
    );

    /// Login repo
    getItInstance.registerFactory(
      () => LoginRepo(
        getItInstance(),
      ),
    );

    /// Login cubit
    getItInstance.registerFactory(
      () => LoginCubit(
        getItInstance(),
      ),
    );
  }
}
