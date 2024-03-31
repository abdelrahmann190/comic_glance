// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeModel _$VolumeModelFromJson(Map<String, dynamic> json) => VolumeModel(
      countOfIssues: json['count_of_issues'] as int?,
      firstIssue: json['first_issue'] as Map<String, dynamic>?,
      lastIssue: json['last_issue'] as Map<String, dynamic>?,
      publisher: json['publisher'] == null
          ? null
          : CreditsModel.fromJson(json['publisher'] as Map<String, dynamic>),
      startYear: json['start_year'] as String?,
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
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      issues: (json['issues'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      objects: (json['objects'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      people: (json['people'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      commonDataModel: json['commonDataModel'] == null
          ? null
          : CommonDataModel.fromJson(
              json['commonDataModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VolumeModelToJson(VolumeModel instance) {
  final val = <String, dynamic>{
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
    'count_of_issues': instance.countOfIssues,
    'first_issue': instance.firstIssue,
    'last_issue': instance.lastIssue,
    'issues': instance.issues,
    'objects': instance.objects,
    'people': instance.people,
    'characters': instance.characters,
    'publisher': instance.publisher,
    'start_year': instance.startYear,
    'locations': instance.locations,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('commonDataModel', instance.commonDataModel);
  return val;
}
