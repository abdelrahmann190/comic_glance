import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'issue_model.g.dart';

@JsonSerializable()
class IssueModel {
  @JsonKey(name: 'character_credits')
  final List? characterCredits;
  @JsonKey(name: 'characters_died_in')
  final List? charactersDiedIn;
  @JsonKey(name: 'concept_credits')
  final List? conceptCredits;
  @JsonKey(name: 'cover_date')
  final String? coverDate;

  @JsonKey(name: 'disbanded_teams')
  final String? disbandedTeams;
  @JsonKey(name: 'first_appearance_characters')
  final String? firstApperanceCharacters;
  @JsonKey(name: 'first_appearance_concepts')
  final String? firstApperanceConcepts;
  @JsonKey(name: 'first_appearance_locations')
  final String? firstApperanceLocations;
  @JsonKey(name: 'first_appearance_objects')
  final String? firstApperanceObjects;
  @JsonKey(name: 'first_appearance_storyarcs')
  final String? firstApperanceStoryArcs;
  @JsonKey(name: 'first_appearance_teams')
  final String? firstApperanceTeams;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;
  @JsonKey(name: 'location_credits')
  final List? locationCredits;

  @JsonKey(name: 'object_credits')
  final List? objectCredits;
  @JsonKey(name: 'person_credits')
  final List? personCredits;

  @JsonKey(name: 'store_date')
  final String? storeDate;
  @JsonKey(name: 'story_arc_credits')
  final List? storyArcCredits;
  @JsonKey(name: 'team_credits')
  final List? teamCredits;
  @JsonKey(name: 'teams_disbanded_in')
  final List? teamsDisbandedIn;
  @JsonKey(name: 'volume')
  final Map<String, dynamic>? volume;
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

  /// Mapped objects
  final CreditsModel? volumeMapped;
  final List<CreditsModel>? characterCreditsMapped;
  final List<CreditsModel>? charactersDiedInMapped;
  final List<CreditsModel>? conceptCreditsMapped;
  final List<CreditsModel>? locationCreditsMapped;
  final List<CreditsModel>? objectCreditsMapped;
  final List<CreditsModel>? personCreditsMapped;
  final List<CreditsModel>? storyArcCreditsMapped;

  final List<CreditsModel>? teamCreditsMapped;
  final List<CreditsModel>? teamsDisbandedInMapped;
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
    this.volumeMapped,
    this.teamsDisbandedInMapped,
    this.teamCreditsMapped,
    this.storyArcCreditsMapped,
    this.personCreditsMapped,
    this.objectCreditsMapped,
    this.locationCreditsMapped,
    this.conceptCreditsMapped,
    this.charactersDiedInMapped,
    this.characterCreditsMapped,
  });

  IssueModel mappedIssueModel() {
    return IssueModel(
      characterCreditsMapped:
          CreditsModel.getListOfCreditsModel(characterCredits),
      charactersDiedInMapped:
          CreditsModel.getListOfCreditsModel(charactersDiedIn),
      conceptCreditsMapped: CreditsModel.getListOfCreditsModel(conceptCredits),
      coverDate: coverDate,
      disbandedTeams: disbandedTeams,
      firstApperanceCharacters: firstApperanceCharacters,
      firstApperanceConcepts: firstApperanceConcepts,
      firstApperanceLocations: firstApperanceLocations,
      firstApperanceObjects: firstApperanceObjects,
      firstApperanceStoryArcs: firstApperanceStoryArcs,
      firstApperanceTeams: firstApperanceTeams,
      issueNumber: issueNumber,
      locationCreditsMapped:
          CreditsModel.getListOfCreditsModel(locationCredits),
      objectCreditsMapped: CreditsModel.getListOfCreditsModel(objectCredits),
      personCreditsMapped: CreditsModel.getListOfCreditsModel(personCredits),
      storeDate: storeDate,
      storyArcCreditsMapped:
          CreditsModel.getListOfCreditsModel(storyArcCredits),
      teamCreditsMapped: CreditsModel.getListOfCreditsModel(teamCredits),
      teamsDisbandedInMapped:
          CreditsModel.getListOfCreditsModel(teamsDisbandedIn),
      volumeMapped: CreditsModel.fromJson(volume ?? {}),
      aliases: aliases,
      apiDetailUrl: apiDetailUrl,
      dateAdded: dateAdded,
      dateLastUpdated: dateLastUpdated,
      deck: deck,
      description: description,
      id: id,
      name: name,
      siteDetailUrl: siteDetailUrl,
      imageModel: imageModel,
    );
  }

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return _$IssueModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}
