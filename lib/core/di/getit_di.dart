import 'package:comic_glance/core/helpers/app_shared_preferences.dart';
import 'package:comic_glance/core/local_data_base/local_database_services.dart';
import 'package:comic_glance/core/networking/comic_glance_api_services.dart';
import 'package:comic_glance/core/networking/app_auth_services.dart';
import 'package:comic_glance/core/networking/dio_factory.dart';
import 'package:comic_glance/core/networking/api_key_service.dart';
import 'package:comic_glance/core/networking/website_images_service.dart';
import 'package:comic_glance/core/theming/theme_controller.dart';
import 'package:comic_glance/core/theming/theme_service.dart';
import 'package:comic_glance/features/comic_book_pages/data/repo/comic_books_repo.dart';
import 'package:comic_glance/features/comic_book_pages/data/repo/my_library_repo.dart';
import 'package:comic_glance/features/comic_book_pages/logic/browse_cubit/browse_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';
import 'package:comic_glance/features/login/data/repos/login_repo.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_cubit.dart';
import 'package:comic_glance/features/signup/data/repo/sign_up_repo.dart';
import 'package:comic_glance/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
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

    /// App Shared Preferenecse
    getItInstance.registerLazySingleton(
      () => AppSharedPrefereneces(
        getItInstance(),
      ),
    );

    final dio = await DioFactory.getDio();

    /// Api Service
    getItInstance.registerLazySingleton(
      () => ComicGlanceApiService(
        dio,
      ),
    );

    /// Website images service
    getItInstance.registerLazySingleton(
      () => WebsiteImagesService(
        dio,
      ),
    );

    /// Comic books api repo
    getItInstance.registerLazySingleton(
      () => ComicBooksRepo(
        getItInstance(),
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
    getItInstance.registerLazySingleton(
      () => AppAuthServices(),
    );

    /// Login repo
    getItInstance.registerLazySingleton(
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

    /// Signup repo
    getItInstance.registerLazySingleton(
      () => SignUpRepo(
        getItInstance(),
      ),
    );

    /// signup cubit
    getItInstance.registerFactory(
      () => SignupCubit(
        getItInstance(),
      ),
    );

    /// Flutter secure storage
    getItInstance.registerLazySingleton(
      () => const FlutterSecureStorage(),
    );

    /// api key services
    getItInstance.registerLazySingleton(
      () => ApiKeyService(),
    );
  }
}
