import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @JsonKey(name: 'medium_url')
  final String? mediumUrl;
  @JsonKey(name: 'screen_url')
  final String? screenUrl;
  @JsonKey(name: 'screen_large_url')
  final String? screenLargeUrl;
  @JsonKey(name: 'small_url')
  final String? smallUrl;
  @JsonKey(name: 'super_url')
  final String? superUrl;
  @JsonKey(name: 'thumb_url')
  final String? thumbUrl;
  @JsonKey(name: 'tiny_url')
  final String? tinyUrl;
  @JsonKey(name: 'original_url')
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
