import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/networking/auth_state.dart';
import 'package:comic_glance/core/networking/connection_checker.dart';
import 'package:comic_glance/core/pages/no_internet_connection_page.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/features/bottom_navigation/ui/pages/main_navigation_page.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/logic/my_library_cubit/my_library_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/issue_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/publisher_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/show_more_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/volume_page.dart';
import 'package:comic_glance/features/login/ui/pages/login_page.dart';
import 'package:comic_glance/features/signup/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final bool _internetConnection;

  AppRouter(this._internetConnection);
  Route? generateRoute(RouteSettings settings) {
    if (_internetConnection) {
      return _buildAuthenticatedRoute(settings);
    } else {
      return MaterialPageRoute(
        builder: (_) => const NoInternetConnectionPage(),
      );
    }
  }

  Route? _buildAuthenticatedRoute(RouteSettings settings) {
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
          builder: (_) => const MainNavigationPage(),
        );
      case AppRoutes.issuePage:
      case AppRoutes.volumePage:
      case AppRoutes.publisherPage:
        return _buildAuthenticatedPageRoute(
          settings,
          (issueLink, navigationLink) => IssuePage(
            issueLink: issueLink,
            navigationLink: navigationLink,
          ),
        );
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

  Route _buildAuthenticatedPageRoute(
      RouteSettings settings, Widget Function(String, String) pageBuilder) {
    final navigationMap = settings.arguments as Map;
    return AuthenticatedRoute(
      builder: (_) => BlocProvider(
        create: (context) => getItInstance<ComicBooksCubit>(),
        child: pageBuilder(
          navigationMap[ApiConstants.apiNavLink] as String,
          navigationMap[ApiConstants.siteNavLink] as String,
        ),
      ),
    );
  }
}

class AuthenticatedRoute extends MaterialPageRoute {
  AuthenticatedRoute({required WidgetBuilder builder})
      : super(
          builder: (context) {
            return AuthState().isSignedIn
                ? builder(context)
                : const LoginPage();
          },
        );
}
