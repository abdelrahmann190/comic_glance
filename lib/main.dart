import 'package:comic_glance/comic_glance_app.dart';
import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/networking/connection_checker.dart';
import 'package:comic_glance/core/router/app_router.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:comic_glance/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(
    CommonDataModelAdapter(),
  );
  Hive.registerAdapter(
    ImageModelAdapter(),
  );
  await Hive.openBox(AppStrings.favorites);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  await GetitDI.init();
  final connectionChecker = getItInstance<ConnectionChecker>();
  runApp(
    ComicGlanceApp(
      getItInstance()..loadSavedThemeSettings(),
      appRouter: AppRouter(await connectionChecker.hasInternetAccess),
    ),
  );
}
