// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeModel _$VolumeModelFromJson(Map<String, dynamic> json) => VolumeModel(
      countOfIssues: json['count_of_issues'] as List<dynamic>?,
      firstIssue: json['first_issue'] as Map<String, dynamic>?,
      lastIssue: json['last_issue'] as Map<String, dynamic>?,
      publisher: json['publisher'] as Map<String, dynamic>?,
      startYear: json['start_year'] as String?,
      aliases: json['aliases'] as String?,
      apiDetailUrl: json['api_detail_url'] as String?,
      dateAdded: json['date_added'] as String?,
      dateLastUpdated: json['date_last_updated'] as String?,
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
      imageMap: json['image'] as Map<String, dynamic>?,
      name: json['name'] as String?,
      siteDetailUrl: json['site_detail_url'] as String?,
    );

Map<String, dynamic> _$VolumeModelToJson(VolumeModel instance) =>
    <String, dynamic>{
      'count_of_issues': instance.countOfIssues,
      'first_issue': instance.firstIssue,
      'last_issue': instance.lastIssue,
      'publisher': instance.publisher,
      'start_year': instance.startYear,
      'aliases': instance.aliases,
      'api_detail_url': instance.apiDetailUrl,
      'date_added': instance.dateAdded,
      'date_last_updated': instance.dateLastUpdated,
      'deck': instance.deck,
      'description': instance.description,
      'id': instance.id,
      'image': instance.imageMap,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
    };
