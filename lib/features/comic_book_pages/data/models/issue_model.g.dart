// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) => IssueModel(
      characterCredits: json['character_credits'] as List<dynamic>?,
      charactersDiedIn: json['characters_died_in'] as List<dynamic>?,
      conceptCredits: json['concept_credits'] as List<dynamic>?,
      coverDate: json['cover_date'] as String?,
      disbandedTeams: json['disbanded_teams'] as String?,
      firstApperanceCharacters: json['first_appearance_characters'] as String?,
      firstApperanceConcepts: json['first_appearance_concepts'] as String?,
      firstApperanceLocations: json['first_appearance_locations'] as String?,
      firstApperanceObjects: json['first_appearance_objects'] as String?,
      firstApperanceStoryArcs: json['first_appearance_storyarcs'] as String?,
      firstApperanceTeams: json['first_appearance_teams'] as String?,
      issueNumber: json['issue_number'] as String?,
      locationCredits: json['location_credits'] as List<dynamic>?,
      objectCredits: json['object_credits'] as List<dynamic>?,
      personCredits: json['person_credits'] as List<dynamic>?,
      storeDate: json['store_date'] as String?,
      storyArcCredits: json['story_arc_credits'] as List<dynamic>?,
      teamCredits: json['team_credits'] as List<dynamic>?,
      teamsDisbandedIn: json['teams_disbanded_in'] as List<dynamic>?,
      volume: json['volume'] as Map<String, dynamic>?,
      aliases: json['aliases'] as String?,
      apiDetailUrl: json['api_detail_url'] as String?,
      dateAdded: json['date_added'] as String?,
      dateLastUpdated: json['date_last_updated'] as String?,
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
      imageModel: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] as String?,
      siteDetailUrl: json['site_detail_url'] as String?,
      volumeMapped: json['volumeMapped'] == null
          ? null
          : CreditsModel.fromJson(json['volumeMapped'] as Map<String, dynamic>),
      teamsDisbandedInMapped: (json['teamsDisbandedInMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamCreditsMapped: (json['teamCreditsMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      storyArcCreditsMapped: (json['storyArcCreditsMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      personCreditsMapped: (json['personCreditsMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectCreditsMapped: (json['objectCreditsMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      locationCreditsMapped: (json['locationCreditsMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      conceptCreditsMapped: (json['conceptCreditsMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      charactersDiedInMapped: (json['charactersDiedInMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      characterCreditsMapped: (json['characterCreditsMapped'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IssueModelToJson(IssueModel instance) =>
    <String, dynamic>{
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
      'aliases': instance.aliases,
      'api_detail_url': instance.apiDetailUrl,
      'date_added': instance.dateAdded,
      'date_last_updated': instance.dateLastUpdated,
      'deck': instance.deck,
      'description': instance.description,
      'id': instance.id,
      'image': ImageModel.toJson(instance.imageModel),
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
      'volumeMapped': instance.volumeMapped,
      'characterCreditsMapped': instance.characterCreditsMapped,
      'charactersDiedInMapped': instance.charactersDiedInMapped,
      'conceptCreditsMapped': instance.conceptCreditsMapped,
      'locationCreditsMapped': instance.locationCreditsMapped,
      'objectCreditsMapped': instance.objectCreditsMapped,
      'personCreditsMapped': instance.personCreditsMapped,
      'storyArcCreditsMapped': instance.storyArcCreditsMapped,
      'teamCreditsMapped': instance.teamCreditsMapped,
      'teamsDisbandedInMapped': instance.teamsDisbandedInMapped,
    };
