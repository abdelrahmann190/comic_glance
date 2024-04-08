import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_data_model.g.dart';

/// This model is used as a shared collection to all data that are being imported from the api

@JsonSerializable()
@HiveType(typeId: 1)
class CommonDataModel extends HiveObject {
  @JsonKey(name: 'aliases')
  @HiveField(0)
  final String? aliases;
  @JsonKey(name: 'api_detail_url')
  @HiveField(1)
  final String? apiDetailUrl;
  @JsonKey(name: 'date_added')
  @HiveField(2)
  final String? dateAdded;
  @JsonKey(name: 'date_last_updated')
  @HiveField(3)
  final String? dateLastUpdated;
  @JsonKey(name: 'deck')
  @HiveField(4)
  final String? deck;
  @JsonKey(name: 'description')
  @HiveField(5)
  final String? description;
  @JsonKey(name: 'id')
  @HiveField(6)
  final int? id;
  @JsonKey(
    name: 'image',
  )
  @HiveField(7)
  final ImageModel? imageModel;
  @JsonKey(name: 'name')
  @HiveField(8)
  final String? name;
  @JsonKey(name: 'site_detail_url')
  @HiveField(9)
  final String? siteDetailUrl;

  CommonDataModel({
    this.aliases,
    this.apiDetailUrl,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.id,
    this.imageModel,
    this.name,
    this.siteDetailUrl,
  });

  factory CommonDataModel.fromJson(Map<String, dynamic> json) {
    return _$CommonDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommonDataModelToJson(this);
}
