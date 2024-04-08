// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      boxOfficeRevenue: json['box_office_revenue'] as String?,
      budget: json['budget'] as String?,
      distributor: json['distributor'] as String?,
      hasStaffReview: json['has_staff_review'] as String?,
      producers: (json['producers'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: json['rating'] as String?,
      releaseDate: json['release_date'] as String?,
      runtime: json['runtime'] as String?,
      studios: (json['studios'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalRevenue: json['total_revenue'] as String?,
      writers: (json['writers'] as List<dynamic>?)
          ?.map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
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
      'box_office_revenue': instance.boxOfficeRevenue,
      'budget': instance.budget,
      'distributor': instance.distributor,
      'has_staff_review': instance.hasStaffReview,
      'producers': instance.producers,
      'rating': instance.rating,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'total_revenue': instance.totalRevenue,
      'studios': instance.studios,
      'writers': instance.writers,
    };
