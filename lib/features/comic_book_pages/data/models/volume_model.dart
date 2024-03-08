// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume_model.g.dart';

@JsonSerializable()
class VolumeModel {
  @JsonKey(name: 'count_of_issues')
  final List? countOfIssues;
  @JsonKey(name: 'first_issue')
  final Map? firstIssue;
  @JsonKey(
    name: 'last_issue',
  )
  final Map<String, dynamic>? lastIssue;
  @JsonKey(name: 'publisher')
  final Map? publisher;

  @JsonKey(name: 'start_year')
  final String? startYear;

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
  final ImageModel imageMap;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;
  VolumeModel({
    this.countOfIssues,
    this.firstIssue,
    this.lastIssue,
    this.publisher,
    this.startYear,
    this.aliases,
    this.apiDetailUrl,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.id,
    required this.imageMap,
    this.name,
    this.siteDetailUrl,
  });

  factory VolumeModel.fromJson(Map<String, dynamic> json) {
    return _$VolumeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VolumeModelToJson(this);
}
