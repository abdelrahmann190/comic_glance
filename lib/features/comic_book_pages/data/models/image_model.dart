import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class ImageModel {
  @JsonKey(name: 'icon_url')
  @HiveField(0)
  final String? iconUrl;
  @JsonKey(name: 'medium_url')
  @HiveField(1)
  final String? mediumUrl;
  @JsonKey(name: 'screen_url')
  @HiveField(2)
  final String? screenUrl;
  @JsonKey(name: 'screen_large_url')
  @HiveField(3)
  final String? screenLargeUrl;
  @JsonKey(name: 'small_url')
  @HiveField(4)
  final String? smallUrl;
  @JsonKey(name: 'super_url')
  @HiveField(5)
  final String? superUrl;
  @JsonKey(name: 'thumb_url')
  @HiveField(6)
  final String? thumbUrl;
  @JsonKey(name: 'tiny_url')
  @HiveField(7)
  final String? tinyUrl;
  @JsonKey(name: 'original_url')
  @HiveField(8)
  final String? originalUrl;

  ImageModel({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  static Map<String, dynamic> toJson(ImageModel instance) =>
      _$ImageModelToJson(instance);
}
