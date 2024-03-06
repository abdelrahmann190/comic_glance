// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonDataModel _$CommonDataModelFromJson(Map<String, dynamic> json) =>
    CommonDataModel(
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
    );

Map<String, dynamic> _$CommonDataModelToJson(CommonDataModel instance) =>
    <String, dynamic>{
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
    };
