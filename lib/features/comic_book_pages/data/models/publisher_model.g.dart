// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublisherModel _$PublisherModelFromJson(Map<String, dynamic> json) =>
    PublisherModel(
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
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      locationAddress: json['location_address'] as String?,
      locationCity: json['location_city'] as String?,
      locationState: json['location_state'] as String?,
      storyArcs: (json['story_arcs'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teams: (json['teams'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumes: (json['volumes'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PublisherModelToJson(PublisherModel instance) =>
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
      'characters': instance.characters,
      'location_address': instance.locationAddress,
      'location_city': instance.locationCity,
      'location_state': instance.locationState,
      'story_arcs': instance.storyArcs,
      'teams': instance.teams,
      'volumes': instance.volumes,
    };
