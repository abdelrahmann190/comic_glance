import 'package:freezed_annotation/freezed_annotation.dart';
part 'credits_model.g.dart';

@JsonSerializable()
class CreditsModel {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;
  @JsonKey(name: 'role')
  final String? role;
  @JsonKey(name: 'issue_number')
  final String? issueNumber;

  CreditsModel({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
    this.role,
    this.issueNumber,
  });

  static CreditsModel fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CreditsModel();
    }
    return _$CreditsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreditsModelToJson(this);
}
