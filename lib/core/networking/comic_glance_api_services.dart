import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/networking/api_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'comic_glance_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ComicGlanceApiService {
  factory ComicGlanceApiService(Dio dio, {String baseUrl}) =
      _ComicGlanceApiService;

  @GET(
    '${ApiConstants.issuesListUrl}{apiKey}${ApiConstants.jsonFormat}${ApiConstants.sortStoreDateDesc}${ApiConstants.filterBatman}',
  )
  Future<ApiResponseModel> getLatestIssuesList(
    @Path('apiKey') String? apiKey,
  );

  @GET(
    '${ApiConstants.volumesListUrl}{apiKey}${ApiConstants.jsonFormat}${ApiConstants.sortIdDesc}${ApiConstants.filterBatman}',
  )
  Future<ApiResponseModel> getMostRecentVolumesList(
    @Path('apiKey') String? apiKey,
  );

  @GET(
    '${ApiConstants.publishersListUrl}{apiKey}${ApiConstants.jsonFormat}${ApiConstants.sortIdAsc}',
  )
  Future<ApiResponseModel> getPopularPublishersList(
    @Path('apiKey') String? apiKey,
  );

  @GET('{customLink}{apiKey}${ApiConstants.jsonFormat}')
  Future<ApiResponseModel> getDataFromCustomLink(
    @Path('customLink') String customLink,
    @Path('apiKey') String? apiKey,
  );

  @GET(
      '${ApiConstants.search}{apiKey}${ApiConstants.jsonFormat}&query={searchQuery}&resources={searchFilters}')
  Future<ApiResponseModel> getSearchResults(
    @Path('searchQuery') String searchQuery,
    @Path('searchFilters') String searchFilters,
    @Path('apiKey') String? apiKey,
  );
}
