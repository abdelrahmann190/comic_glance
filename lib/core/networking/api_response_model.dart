import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

@JsonSerializable()
class ApiResponseModel {
  final dynamic results;

  ApiResponseModel({
    this.results,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseModelToJson(this);
}
