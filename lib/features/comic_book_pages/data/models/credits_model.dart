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

  CreditsModel({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
    this.role,
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) =>
      _$CreditsModelFromJson(json);

  static List<CreditsModel>? getListOfCreditsModel(List? creditsList) {
    if (creditsList != null && creditsList.isNotEmpty) {
      final cleanedCreditsList = creditsList;
      cleanedCreditsList.removeWhere((element) => element == null);
      return cleanedCreditsList.map(
        (credits) {
          return CreditsModel.fromJson(credits);
        },
      ).toList();
    }
    return null;
  }

  Map<String, dynamic> toJson() => _$CreditsModelToJson(this);
}
