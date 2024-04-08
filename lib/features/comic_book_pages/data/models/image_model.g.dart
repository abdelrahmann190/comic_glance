// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageModelAdapter extends TypeAdapter<ImageModel> {
  @override
  final int typeId = 2;

  @override
  ImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageModel(
      iconUrl: fields[0] as String?,
      mediumUrl: fields[1] as String?,
      screenUrl: fields[2] as String?,
      screenLargeUrl: fields[3] as String?,
      smallUrl: fields[4] as String?,
      superUrl: fields[5] as String?,
      thumbUrl: fields[6] as String?,
      tinyUrl: fields[7] as String?,
      originalUrl: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.iconUrl)
      ..writeByte(1)
      ..write(obj.mediumUrl)
      ..writeByte(2)
      ..write(obj.screenUrl)
      ..writeByte(3)
      ..write(obj.screenLargeUrl)
      ..writeByte(4)
      ..write(obj.smallUrl)
      ..writeByte(5)
      ..write(obj.superUrl)
      ..writeByte(6)
      ..write(obj.thumbUrl)
      ..writeByte(7)
      ..write(obj.tinyUrl)
      ..writeByte(8)
      ..write(obj.originalUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      iconUrl: json['icon_url'] as String?,
      mediumUrl: json['medium_url'] as String?,
      screenUrl: json['screen_url'] as String?,
      screenLargeUrl: json['screen_large_url'] as String?,
      smallUrl: json['small_url'] as String?,
      superUrl: json['super_url'] as String?,
      thumbUrl: json['thumb_url'] as String?,
      tinyUrl: json['tiny_url'] as String?,
      originalUrl: json['original_url'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'icon_url': instance.iconUrl,
      'medium_url': instance.mediumUrl,
      'screen_url': instance.screenUrl,
      'screen_large_url': instance.screenLargeUrl,
      'small_url': instance.smallUrl,
      'super_url': instance.superUrl,
      'thumb_url': instance.thumbUrl,
      'tiny_url': instance.tinyUrl,
      'original_url': instance.originalUrl,
    };
