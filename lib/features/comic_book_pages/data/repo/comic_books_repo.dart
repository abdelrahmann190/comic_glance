import 'package:comic_glance/core/networking/api_key_service.dart';
import 'package:comic_glance/core/networking/api_response_model.dart';
import 'package:comic_glance/core/networking/api_result.dart';
import 'package:comic_glance/core/networking/comic_glance_api_services.dart';
import 'package:comic_glance/core/networking/networking_error_handler.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/character_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/issue_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/publisher_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/volume_model.dart';

class ComicBooksRepo {
  final ComicGlanceApiService _apiService;
  final ApiKeyService _apiKeyService;
  ComicBooksRepo(this._apiService, this._apiKeyService);

  Future<ApiResult<List<CommonDataModel>>> getIssuesList() async {
    try {
      final apiResponse = await _apiService.getLatestIssuesList(
        await _apiKeyService.getApiKey(),
      );
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
      final apiResponse = await _apiService
          .getMostRecentVolumesList(await _apiKeyService.getApiKey());
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
      final apiResponse = await _apiService
          .getPopularPublishersList(await _apiKeyService.getApiKey());
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

  Future<ApiResult<VolumeModel>> getVolumeFromCustomLink(
      String customLink) async {
    try {
      final apiResponse = await _getDataFromCustomLink(customLink);
      final resultMap = apiResponse.results as Map<String, dynamic>;

      return ApiResult.success(
        VolumeModel.fromJson(
          resultMap,
        ),
      );
    } catch (error) {
      print(error);
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
        ),
      );
    } catch (error) {
      print(error);
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult<CharacterModel>> getCharacterFromCustomLink(
    String customLink,
  ) async {
    try {
      final apiResponse = await _getDataFromCustomLink(customLink);
      final resultMap = apiResponse.results as Map<String, dynamic>;

      return ApiResult.success(
        CharacterModel.fromJson(
          resultMap,
        ),
      );
    } catch (error) {
      print(error);
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult<PublisherModel>> getPublisherFromCustomLink(
    String customLink,
  ) async {
    try {
      final apiResponse = await _getDataFromCustomLink(customLink);
      final resultMap = apiResponse.results as Map<String, dynamic>;

      return ApiResult.success(
        PublisherModel.fromJson(
          resultMap,
        ),
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
    final results = _apiService.getDataFromCustomLink(
      customLink,
      await _apiKeyService.getApiKey(),
    );
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
        await _apiKeyService.getApiKey(),
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
