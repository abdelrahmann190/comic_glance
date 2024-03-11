// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/theming/app_theme.dart';
import 'package:comic_glance/core/theming/theme_controller.dart';
import 'package:flutter/material.dart';

import 'package:comic_glance/core/router/app_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicGlanceApp extends StatelessWidget {
  final ThemeController _themeController;
  final AppRouter appRouter;
  const ComicGlanceApp(
    this._themeController, {
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ListenableBuilder(
          listenable: _themeController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              theme: AppTheme.light(),
              darkTheme: AppTheme.dark(),
              themeMode: _themeController.themeMode,
              initialRoute: AppRoutes.mainNavigationPage,
              onGenerateRoute: appRouter.generateRoute,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
