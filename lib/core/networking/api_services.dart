import 'package:comic_glance/core/networking/api_constants.dart';
import 'package:comic_glance/core/networking/api_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ComicGlanceApiService {
  factory ComicGlanceApiService(Dio dio, {String baseUrl}) =
      _ComicGlanceApiService;

  @GET(
    ApiConstants.issuesListUrl +
        ApiConstants.apiKey +
        ApiConstants.jsonFormat +
        ApiConstants.sortStoreDateDesc +
        ApiConstants.filterBatman,
  )
  Future<ApiResponseModel> getLatestIssuesList();

  @GET(
    ApiConstants.volumesListUrl +
        ApiConstants.apiKey +
        ApiConstants.jsonFormat +
        ApiConstants.sortIdDesc +
        ApiConstants.filterBatman,
  )
  Future<ApiResponseModel> getMostRecentVolumesList();

  @GET(
    ApiConstants.publishersListUrl +
        ApiConstants.apiKey +
        ApiConstants.jsonFormat +
        ApiConstants.sortIdAsc,
  )
  Future<ApiResponseModel> getPopularPublishersList();

  @GET('{customLink}${ApiConstants.apiKey}${ApiConstants.jsonFormat}')
  Future<ApiResponseModel> getDataFromCustomLink(
    @Path('customLink') String customLink,
  );
}
