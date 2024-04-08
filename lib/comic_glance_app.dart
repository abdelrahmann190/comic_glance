// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/core/theming/app_theme.dart';
import 'package:comic_glance/core/theming/theme_controller.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';

import 'package:comic_glance/core/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicGlanceApp extends StatelessWidget {
  final ThemeController _themeController;
  const ComicGlanceApp(
    this._themeController, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ListenableBuilder(
          listenable: _themeController,
          builder: (BuildContext context, Widget? child) {
            return BlocProvider(
              create: (context) => getItInstance<MyLibraryCubit>(),
              child: ConnectivityAppWrapper(
                app: MaterialApp(
                  theme: AppTheme.light(),
                  darkTheme: AppTheme.dark(),
                  themeMode: _themeController.themeMode,
                  initialRoute: AppRoutes.mainNavigationPage,
                  onGenerateRoute: AppRouter.generateRoute,
                  debugShowCheckedModeBanner: false,
                  builder: (buildContext, widget) {
                    return ConnectivityWidgetWrapper(
                      disableInteraction: true,
                      height: 80,
                      child: widget ?? const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
