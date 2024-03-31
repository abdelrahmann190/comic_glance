// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) => IssueModel(
      characterCredits: (json['character_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      charactersDiedIn: (json['characters_died_in'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      conceptCredits: (json['concept_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverDate: json['cover_date'] as String?,
      disbandedTeams: (json['disbanded_teams'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstApperanceCharacters:
          (json['first_appearance_characters'] as List<dynamic>?)
              ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      firstApperanceConcepts:
          (json['first_appearance_concepts'] as List<dynamic>?)
              ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      firstApperanceLocations:
          (json['first_appearance_locations'] as List<dynamic>?)
              ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      firstApperanceObjects:
          (json['first_appearance_objects'] as List<dynamic>?)
              ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      firstApperanceStoryArcs:
          (json['first_appearance_storyarcs'] as List<dynamic>?)
              ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      firstApperanceTeams: (json['first_appearance_teams'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      issueNumber: json['issue_number'] as String?,
      locationCredits: (json['location_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectCredits: (json['object_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      personCredits: (json['person_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      storeDate: json['store_date'] as String?,
      storyArcCredits: (json['story_arc_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamCredits: (json['team_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamsDisbandedIn: (json['teams_disbanded_in'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      volume: json['volume'] == null
          ? null
          : CreditsModel.fromJson(json['volume'] as Map<String, dynamic>),
      aliases: json['aliases'] as String?,
      apiDetailUrl: json['api_detail_url'] as String?,
      dateAdded: json['date_added'] as String?,
      dateLastUpdated: json['date_last_updated'] as String?,
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
      imageModel: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] as String?,
      siteDetailUrl: json['site_detail_url'] as String?,
    );

Map<String, dynamic> _$IssueModelToJson(IssueModel instance) =>
    <String, dynamic>{
      'aliases': instance.aliases,
      'api_detail_url': instance.apiDetailUrl,
      'date_added': instance.dateAdded,
      'date_last_updated': instance.dateLastUpdated,
      'deck': instance.deck,
      'description': instance.description,
      'id': instance.id,
      'image': instance.imageModel,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
      'character_credits': instance.characterCredits,
      'characters_died_in': instance.charactersDiedIn,
      'concept_credits': instance.conceptCredits,
      'cover_date': instance.coverDate,
      'disbanded_teams': instance.disbandedTeams,
      'first_appearance_characters': instance.firstApperanceCharacters,
      'first_appearance_concepts': instance.firstApperanceConcepts,
      'first_appearance_locations': instance.firstApperanceLocations,
      'first_appearance_objects': instance.firstApperanceObjects,
      'first_appearance_storyarcs': instance.firstApperanceStoryArcs,
      'first_appearance_teams': instance.firstApperanceTeams,
      'issue_number': instance.issueNumber,
      'location_credits': instance.locationCredits,
      'object_credits': instance.objectCredits,
      'person_credits': instance.personCredits,
      'store_date': instance.storeDate,
      'story_arc_credits': instance.storyArcCredits,
      'team_credits': instance.teamCredits,
      'teams_disbanded_in': instance.teamsDisbandedIn,
      'volume': instance.volume,
    };
