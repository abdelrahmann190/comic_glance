import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/networking/auth_state.dart';
import 'package:comic_glance/core/router/app_routes.dart';
import 'package:comic_glance/features/bottom_navigation/ui/pages/main_navigation_page.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/logic/comic_books_cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/character_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/issue_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/movie_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/publisher_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/show_more_credits_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/show_more_page.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/volume_page.dart';
import 'package:comic_glance/features/login/ui/pages/login_page.dart';
import 'package:comic_glance/features/signup/logic/cubit/signup_cubit.dart';
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
          builder: (_) => BlocProvider(
            create: (context) => getItInstance<SignupCubit>(),
            child: const SignupPage(),
          ),
        );
      case AppRoutes.mainNavigationPage:
        return AuthenticatedRoute(
          builder: (_) => const MainNavigationPage(),
        );
      case AppRoutes.issuePage:
        return _buildAuthenticatedPageRoute(
          settings,
          (issueLink, navigationLink) => IssuePage(
            issueLink: issueLink,
            navigationLink: navigationLink,
          ),
        );
      case AppRoutes.volumePage:
        return _buildAuthenticatedPageRoute(
          settings,
          (issueLink, navigationLink) => VolumePage(
            issueLink: issueLink,
            navigationLink: navigationLink,
          ),
        );
      case AppRoutes.publisherPage:
        return _buildAuthenticatedPageRoute(
          settings,
          (issueLink, navigationLink) => PublisherPage(
            issueLink: issueLink,
            navigationLink: navigationLink,
          ),
        );
      case AppRoutes.characterPage:
        return _buildAuthenticatedPageRoute(
          settings,
          (issueLink, navigationLink) => CharacterPage(
            issueLink: issueLink,
            navigationLink: navigationLink,
          ),
        );
      case AppRoutes.moviePage:
        return _buildAuthenticatedPageRoute(
          settings,
          (issueLink, navigationLink) => MoviePage(
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
      case AppRoutes.showMoreCreditsPage:
        return AuthenticatedRoute(
          builder: (_) => ShowMoreCreditsPage(
            data: settings.arguments as List<CreditsModel>,
          ),
        );
      default:
        return null;
    }
  }

  static Route _buildAuthenticatedPageRoute(
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
