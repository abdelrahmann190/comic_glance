import 'package:comic_glance/core/networking/api_constants.dart';

class AppRoutes {
  static const String mainNavigationPage = '/mainNavigationPage';
  static const String issuePage = '/issuePage';
  static const String volumePage = '/volumePage';
  static const String publisherPage = '/publisherPage';
  static const String characterPage = '/characterPage';

  static const String loginPage = '/loginPage';
  static const String signUpPage = '/signUpPage';
  static const String showMorePage = '/showMorePage';
  static const String showMoreCreditsPage = '/showMoreCreditsPage';

  static String getRouteAccordingToApiLink(String apiLink) {
    if (apiLink.contains(ApiConstants.issueID)) {
      return issuePage;
    }
    if (apiLink.contains(ApiConstants.volumeID)) {
      return volumePage;
    }
    if (apiLink.contains(ApiConstants.publisherID)) {
      return publisherPage;
    }
    if (apiLink.contains(ApiConstants.characterID)) {
      return characterPage;
    }
    return '';
  }
}
