import 'package:comic_glance/core/networking/api_response_model.dart';
import 'package:comic_glance/core/networking/api_result.dart';
import 'package:comic_glance/core/networking/api_services.dart';
import 'package:comic_glance/core/networking/networking_error_handler.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/issue_model.dart';

class ComicBooksRepo {
  final ComicGlanceApiService _apiService;

  ComicBooksRepo(this._apiService);

  Future<ApiResult<List<CommonDataModel>>> getIssuesList() async {
    try {
      final apiResponse = await _apiService.getLatestIssuesList();
      final resultsList = apiResponse.results as List;
      return ApiResult.success(
        resultsList
            .map((issueModel) => CommonDataModel.fromJson(issueModel))
            .toList(),
      );
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult<List<CommonDataModel>>> getMostRecentVolumesList() async {
    try {
      final apiResponse = await _apiService.getMostRecentVolumesList();
      final resultsList = apiResponse.results as List;
      return ApiResult.success(
        resultsList
            .map(
              (commonDataModel) => CommonDataModel.fromJson(commonDataModel),
            )
            .toList(),
      );
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult<List<CommonDataModel>>> getPopularPublishersList() async {
    try {
      final apiResponse = await _apiService.getPopularPublishersList();
      final resultsList = apiResponse.results as List;
      return ApiResult.success(
        resultsList
            .map(
              (commonDataModel) => CommonDataModel.fromJson(commonDataModel),
            )
            .toList(),
      );
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult<IssueModel>> getIssueFromCustomLink(
    String customLink,
  ) async {
    try {
      final apiResponse = await _getDataFromCustomLink(customLink);
      final resultMap = apiResponse.results as Map<String, dynamic>;

      return ApiResult.success(
        IssueModel.fromJson(
          resultMap,
        ).mappedIssueModel(),
      );
    } catch (error) {
      print(error);
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResponseModel> _getDataFromCustomLink(
    String customLink,
  ) async {
    final results = _apiService.getDataFromCustomLink(customLink);
    return results;
  }

  Future<ApiResult<List<CommonDataModel>>> getSearchResults(
    String searchQuery,
    String searchFilters,
  ) async {
    try {
      final apiResponse = await _apiService.getSearchResults(
        searchQuery,
        searchFilters,
      );
      final resultsList = apiResponse.results as List;
      return ApiResult.success(
        resultsList
            .map(
              (commonDataModel) => CommonDataModel.fromJson(commonDataModel),
            )
            .toList(),
      );
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }
}
