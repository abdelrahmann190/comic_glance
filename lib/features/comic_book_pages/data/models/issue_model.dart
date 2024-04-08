import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'issue_model.g.dart';

@JsonSerializable()
class IssueModel extends CommonDataModel {
  @JsonKey(name: 'character_credits')
  final List<CreditsModel>? characterCredits;
  @JsonKey(name: 'characters_died_in')
  final List<CreditsModel>? charactersDiedIn;
  @JsonKey(name: 'concept_credits')
  final List<CreditsModel>? conceptCredits;
  @JsonKey(name: 'cover_date')
  final String? coverDate;

  @JsonKey(name: 'disbanded_teams')
  final List<CreditsModel>? disbandedTeams;
  @JsonKey(name: 'first_appearance_characters')
  final List<CreditsModel>? firstApperanceCharacters;
  @JsonKey(name: 'first_appearance_concepts')
  final List<CreditsModel>? firstApperanceConcepts;
  @JsonKey(name: 'first_appearance_locations')
  final List<CreditsModel>? firstApperanceLocations;
  @JsonKey(name: 'first_appearance_objects')
  final List<CreditsModel>? firstApperanceObjects;
  @JsonKey(name: 'first_appearance_storyarcs')
  final List<CreditsModel>? firstApperanceStoryArcs;
  @JsonKey(name: 'first_appearance_teams')
  final List<CreditsModel>? firstApperanceTeams;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;
  @JsonKey(name: 'location_credits')
  final List<CreditsModel>? locationCredits;

  @JsonKey(name: 'object_credits')
  final List<CreditsModel>? objectCredits;
  @JsonKey(name: 'person_credits')
  final List<CreditsModel>? personCredits;

  @JsonKey(name: 'store_date')
  final String? storeDate;
  @JsonKey(name: 'story_arc_credits')
  final List<CreditsModel>? storyArcCredits;
  @JsonKey(name: 'team_credits')
  final List<CreditsModel>? teamCredits;
  @JsonKey(name: 'teams_disbanded_in')
  final List<CreditsModel>? teamsDisbandedIn;
  @JsonKey(name: 'volume')
  final CreditsModel? volume;

  IssueModel({
    this.characterCredits,
    this.charactersDiedIn,
    this.conceptCredits,
    this.coverDate,
    this.disbandedTeams,
    this.firstApperanceCharacters,
    this.firstApperanceConcepts,
    this.firstApperanceLocations,
    this.firstApperanceObjects,
    this.firstApperanceStoryArcs,
    this.firstApperanceTeams,
    this.issueNumber,
    this.locationCredits,
    this.objectCredits,
    this.personCredits,
    this.storeDate,
    this.storyArcCredits,
    this.teamCredits,
    this.teamsDisbandedIn,
    this.volume,
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
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return _$IssueModelFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}
