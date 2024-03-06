import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_data_model.g.dart';

/// This model is used as a shared collection to all data that are being imported from the api

@JsonSerializable()
class CommonDataModel {
  @JsonKey(name: 'aliases')
  final String? aliases;
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;
  @JsonKey(name: 'date_added')
  final String? dateAdded;
  @JsonKey(name: 'date_last_updated')
  final String? dateLastUpdated;
  @JsonKey(name: 'deck')
  final String? deck;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(
    name: 'image',
    fromJson: ImageModel.fromJson,
    toJson: ImageModel.toJson,
  )
  final ImageModel imageModel;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;

  CommonDataModel({
    this.aliases,
    this.apiDetailUrl,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.id,
    required this.imageModel,
    this.name,
    this.siteDetailUrl,
  });

  factory CommonDataModel.fromJson(Map<String, dynamic> json) {
    return _$CommonDataModelFromJson(json);
  }

  static Map<String, dynamic> toJson(CommonDataModel commonDataModel) =>
      _$CommonDataModelToJson(commonDataModel);
}
