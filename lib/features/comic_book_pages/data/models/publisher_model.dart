import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'publisher_model.g.dart';

@JsonSerializable()
class PublisherModel extends CommonDataModel {
  @JsonKey(name: 'characters')
  final List<CreditsModel>? characters;
  @JsonKey(name: 'location_address')
  final String? locationAddress;
  @JsonKey(name: 'location_city')
  final String? locationCity;
  @JsonKey(name: 'location_state')
  final String? locationState;
  @JsonKey(name: 'story_arcs')
  final List<CreditsModel>? storyArcs;
  @JsonKey(name: 'teams')
  final List<CreditsModel>? teams;
  @JsonKey(name: 'volumes')
  final List<CreditsModel>? volumes;
  PublisherModel({
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
    this.characters,
    this.locationAddress,
    this.locationCity,
    this.locationState,
    this.storyArcs,
    this.teams,
    this.volumes,
  });

  factory PublisherModel.fromJson(Map<String, dynamic> json) =>
      _$PublisherModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PublisherModelToJson(this);
}
