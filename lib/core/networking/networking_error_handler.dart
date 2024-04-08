import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,

  defaultError
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int apiLogicError = 422;

  // Local status codes
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout =
      -3; // Corrected spelling from "RECIEVE_TIMEOUT"
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String noContent =
      ApiErrorMessages.noContent; // success with no data (no content)
  static const String badRequest =
      ApiErrorMessages.badRequestError; // failure, API rejected request
  static const String unauthorized =
      ApiErrorMessages.unauthorizedError; // failure, user is not authorised
  static const String forbidden =
      ApiErrorMessages.forbiddenError; //  failure, API rejected request
  static const String internalServerError =
      ApiErrorMessages.internalServerError; // failure, crash in server side
  static const String notFound =
      ApiErrorMessages.notFoundError; // failure, crash in server side

  // local status  statuscode
  static String connectTimeout = ApiErrorMessages.timeoutError;
  static String cancel = ApiErrorMessages.defaultError;
  static String recieveTimeout = ApiErrorMessages.timeoutError;
  static String sendTimeout = ApiErrorMessages.timeoutError;
  static String cacheError = ApiErrorMessages.cacheError;
  static String noInternetError = ApiErrorMessages.noInternetError;
  static String defaultError = ApiErrorMessages.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(
            statusCode: ResponseCode.noContent,
            message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return ApiErrorModel(
            statusCode: ResponseCode.badRequest,
            message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return ApiErrorModel(
            statusCode: ResponseCode.forbidden,
            message: ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return ApiErrorModel(
            statusCode: ResponseCode.unauthorized,
            message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return ApiErrorModel(
            statusCode: ResponseCode.notFound,
            message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ApiErrorModel(
            statusCode: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return ApiErrorModel(
            statusCode: ResponseCode.connectTimeout,
            message: ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return ApiErrorModel(
            statusCode: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return ApiErrorModel(
            statusCode: ResponseCode.receiveTimeout,
            message: ResponseMessage.recieveTimeout);
      case DataSource.sendTimeout:
        return ApiErrorModel(
            statusCode: ResponseCode.sendTimeout,
            message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return ApiErrorModel(
            statusCode: ResponseCode.cacheError,
            message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ApiErrorModel(
            statusCode: ResponseCode.noInternetConnection,
            message: ResponseMessage.noInternetError);
      case DataSource.defaultError:
        return ApiErrorModel(
          statusCode: ResponseCode.defaultError,
          message: ResponseMessage.defaultError,
        );
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleDioException(error);
    } else if (error is FirebaseAuthException) {
      // firebase related error
      apiErrorModel = _handleFirebaseException(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

ApiErrorModel _handleDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      return _handleBadResponseFromApi(error);
    case DioExceptionType.unknown:
      return _handleBadResponseFromApi(error);

    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

ApiErrorModel _handleBadResponseFromApi(DioException error) {
  if (error.response != null &&
      error.response?.statusCode != null &&
      error.response?.statusMessage != null) {
    return ApiErrorModel.fromJson(error.response!.data);
  } else {
    return DataSource.defaultError.getFailure();
  }
}

ApiErrorModel _handleFirebaseException(FirebaseAuthException error) {
  switch (error.code) {
    case 'user-not-found':
      return ApiErrorModel(
        message: AuthErrorMessages.userNotFound,
      );
    case 'wrong-password':
      return ApiErrorModel(message: AuthErrorMessages.wrongPassword);
    case 'weak-password':
      return ApiErrorModel(message: AuthErrorMessages.weakPassword);
    case 'email-already-in-use':
      return ApiErrorModel(message: AuthErrorMessages.emailAlreadyInUse);
    case 'invalid-email':
      return ApiErrorModel(message: AuthErrorMessages.invalidEmail);
    case 'operation-not-allowed':
      return ApiErrorModel(message: AuthErrorMessages.operationNotAllowed);
    case 'too-many-requests':
      return ApiErrorModel(message: AuthErrorMessages.tooManyRequests);
    case 'user-disabled':
      return ApiErrorModel(message: AuthErrorMessages.userDisabled);
    case 'network-request-failed':
      return ApiErrorModel(message: AuthErrorMessages.networkRequestFailed);
    case 'requires-recent-login':
      return ApiErrorModel(message: AuthErrorMessages.requiresRecentLogin);
    case 'invalid-credential':
      return ApiErrorModel(message: AuthErrorMessages.wrongPassword);

    default:
      return ApiErrorModel(message: AuthErrorMessages.unknownError);
  }
}

class ApiInternalStatus {
  static const int success = 1;
  static const int failure = 0;
}
