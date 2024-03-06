import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'error')
  final String? message;

  ApiErrorModel({
    this.statusCode,
    required this.message,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
