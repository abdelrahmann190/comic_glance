// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      birth: json['birth'] as String?,
      characterEnemies: (json['character_enemies'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      characterFriends: (json['character_friends'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      countOfIssueAppearances: json['count_of_issue_appearances'] as int?,
      creators: (json['creators'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateAdded: json['date_added'] as String?,
      dateLastUpdated: json['date_last_updated'] as String?,
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      firstAppearedIIssue: json['first_appeared_in_issue'] == null
          ? null
          : CreditsModel.fromJson(
              json['first_appeared_in_issue'] as Map<String, dynamic>),
      id: json['id'] as int?,
      issueCredits: (json['issue_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      issuesDiedIn: (json['issues_died_in'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      powers: (json['powers'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      publisher: json['publisher'] == null
          ? null
          : CreditsModel.fromJson(json['publisher'] as Map<String, dynamic>),
      realName: json['real_name'] as String?,
      storyArcCredits: (json['story_arc_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamEnemies: (json['team_enemies'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamFriends: (json['team_friends'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teams: (json['teams'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeCredits: (json['volume_credits'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageModel: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      apiDetailUrl: json['api_detail_url'] as String?,
      siteDetailUrl: json['site_detail_url'] as String?,
      aliases: json['aliases'] as String?,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
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
      'birth': instance.birth,
      'character_enemies': instance.characterEnemies,
      'character_friends': instance.characterFriends,
      'count_of_issue_appearances': instance.countOfIssueAppearances,
      'creators': instance.creators,
      'first_appeared_in_issue': instance.firstAppearedIIssue,
      'issue_credits': instance.issueCredits,
      'issues_died_in': instance.issuesDiedIn,
      'movies': instance.movies,
      'powers': instance.powers,
      'publisher': instance.publisher,
      'real_name': instance.realName,
      'story_arc_credits': instance.storyArcCredits,
      'team_enemies': instance.teamEnemies,
      'team_friends': instance.teamFriends,
      'teams': instance.teams,
      'volume_credits': instance.volumeCredits,
    };
