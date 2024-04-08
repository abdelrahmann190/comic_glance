import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends CommonDataModel {
  @JsonKey(name: 'box_office_revenue')
  final String? boxOfficeRevenue;
  @JsonKey(name: 'budget')
  final String? budget;
  @JsonKey(name: 'distributor')
  final String? distributor;
  @JsonKey(name: 'has_staff_review')
  final String? hasStaffReview;
  @JsonKey(name: 'producers')
  final List<CreditsModel>? producers;
  @JsonKey(name: 'rating')
  final String? rating;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'runtime')
  final String? runtime;
  @JsonKey(name: 'total_revenue')
  final String? totalRevenue;
  @JsonKey(name: 'studios')
  final List<CreditsModel>? studios;

  @JsonKey(name: 'writers')
  final List<CreditsModel>? writers;
  MovieModel({
    this.boxOfficeRevenue,
    this.budget,
    this.distributor,
    this.hasStaffReview,
    this.producers,
    this.rating,
    this.releaseDate,
    this.runtime,
    this.studios,
    this.totalRevenue,
    this.writers,
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

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
