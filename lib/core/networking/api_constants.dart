class ApiConstants {
  static const String apiKey =
      '?api_key=c04dc84242228c6db4bf419f94ea92fc07026a9f';
  static const String jsonFormat = '&format=json';
  static const String baseUrl = 'http://www.comicvine.com/api';
  static const String characterUrl = '/character/';
  static const String charactersListUrl = '/characters/';
  static const String issueUrl = '/issue/';
  static const String issuesListUrl = '/issues/';
  static const String volumesListUrl = '/volumes/';
  static const String publishersListUrl = '/publishers/';

  static const String sortStoreDateDesc = '&sort=store_date:desc';
  static const String sortIdDesc = '&sort=id:desc';

  static const String sortIdAsc = '&sort=id:asc';

  static const String filterMarvel = '&filter=name:marvel';
  static const String filterIronman = '&filter=name:ironman';

  static const String filterDC = '&filter=name:dc';

  static const String filterBatman = '&filter=name:batman';
  static const String apiNavLink = 'apiNavLink';
  static const String siteNavLink = 'siteNavLink';

  static const String issueID = '4000';
  static const String volumeID = '4050';
  static const String publisherID = '4010';
}

class ApiErrorMessages {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "Some thing went wrong please try again";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

class AuthErrorMessages {
  static const String userNotFound = 'No user found for the provided email.';
  static const String wrongPassword = 'Incorrect password. Please try again.';
  static const String weakPassword =
      'The password is too weak. Please use a stronger password.';
  static const String emailAlreadyInUse =
      'The email is already in use by another account.';
  static const String invalidEmail =
      'The email address is invalid. Please enter a valid email address.';
  static const String operationNotAllowed =
      'This operation is not allowed. Please enable it in the Firebase Console.';
  static const String tooManyRequests =
      'Too many requests. Please try again later.';
  static const String userDisabled =
      'The user account has been disabled by an administrator.';
  static const String networkRequestFailed =
      'A network error occurred. Please check your internet connection and try again.';
  static const String requiresRecentLogin =
      'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
  static const String unknownError =
      'An unknown error occurred. Please try again.';
}
