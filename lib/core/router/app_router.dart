import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/networking/auth_state.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/features/bottom_navigation/ui/pages/bottom_navigation_bar_main_page.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/issue_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/publisher_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/show_more_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/volume_page.dart';
import 'package:comic_glance/features/login/ui/pages/login_page.dart';
import 'package:comic_glance/features/signup/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case AppRoutes.signUpPage:
        return MaterialPageRoute(
          builder: (_) => const SignupPage(),
        );
      case AppRoutes.mainNavigationPage:
        return AuthenticatedRoute(
          builder: (_) => const BottomNavigationBarMainPage(),
        );
      case AppRoutes.issuePage:
        return AuthenticatedRoute(builder: (_) {
          final navigationMap = settings.arguments as Map;
          return BlocProvider(
            create: (context) => getItInstance<ComicBooksCubit>(),
            child: IssuePage(
              issueLink: navigationMap[ApiConstants.apiNavLink] as String,
              navigationLink: navigationMap[ApiConstants.siteNavLink] as String,
            ),
          );
        });
      case AppRoutes.volumePage:
        return AuthenticatedRoute(builder: (_) {
          final navigationMap = settings.arguments as Map;
          return BlocProvider(
            create: (context) => getItInstance<ComicBooksCubit>(),
            child: VolumePage(
              issueLink: navigationMap[ApiConstants.apiNavLink] as String,
              navigationLink: navigationMap[ApiConstants.siteNavLink] as String,
            ),
          );
        });
      case AppRoutes.publisherPage:
        return AuthenticatedRoute(builder: (_) {
          final navigationMap = settings.arguments as Map;
          return BlocProvider(
            create: (context) => getItInstance<ComicBooksCubit>(),
            child: PublisherPage(
              issueLink: navigationMap[ApiConstants.apiNavLink] as String,
              navigationLink: navigationMap[ApiConstants.siteNavLink] as String,
            ),
          );
        });
      case AppRoutes.showMorePage:
        return AuthenticatedRoute(
          builder: (_) => ShowMorePage(
            data: settings.arguments as List<CommonDataModel>,
          ),
        );
      default:
        return null;
    }
  }
}

class AuthenticatedRoute extends MaterialPageRoute {
  AuthenticatedRoute({required WidgetBuilder builder})
      : super(
          builder: (context) {
            return true ? builder(context) : const LoginPage();
          },
        );
}
