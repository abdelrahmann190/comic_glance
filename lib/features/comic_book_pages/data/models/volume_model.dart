// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume_model.g.dart';

@JsonSerializable()
class VolumeModel extends CommonDataModel {
  @JsonKey(name: 'count_of_issues')
  final int? countOfIssues;
  @JsonKey(name: 'first_issue')
  final Map? firstIssue;
  @JsonKey(name: 'last_issue')
  final Map<String, dynamic>? lastIssue;
  @JsonKey(name: 'issues')
  final List<CreditsModel>? issues;
  @JsonKey(name: 'objects')
  final List<CreditsModel>? objects;
  @JsonKey(name: 'people')
  final List<CreditsModel>? people;
  @JsonKey(name: 'characters')
  final List<CreditsModel>? characters;
  @JsonKey(name: 'publisher')
  final CreditsModel? publisher;
  @JsonKey(name: 'start_year')
  final String? startYear;
  @JsonKey(name: 'locations')
  final List<CreditsModel>? locations;
  @JsonKey(includeIfNull: false)
  CommonDataModel? commonDataModel;
  VolumeModel({
    this.countOfIssues,
    this.firstIssue,
    this.lastIssue,
    this.publisher,
    this.startYear,
    super.aliases,
    super.apiDetailUrl,
    super.dateAdded,
    super.dateLastUpdated,
    super.deck,
    super.description,
    super.id,
    super.imageModel,
    super.name,
    super.siteDetailUrl,
    this.locations,
    this.issues,
    this.objects,
    this.people,
    this.characters,
    this.commonDataModel,
  });

  VolumeModel volumeModelMapped(Map<String, dynamic> json) {
    commonDataModel = CommonDataModel.fromJson(json);
    return this;
  }

  factory VolumeModel.fromJson(Map<String, dynamic> json) {
    return _$VolumeModelFromJson(json).volumeModelMapped(json);
  }
  @override
  Map<String, dynamic> toJson() => _$VolumeModelToJson(this);
}
