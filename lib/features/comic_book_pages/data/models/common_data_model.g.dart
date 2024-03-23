// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonDataModelAdapter extends TypeAdapter<CommonDataModel> {
  @override
  final int typeId = 1;

  @override
  CommonDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonDataModel(
      aliases: fields[0] as String?,
      apiDetailUrl: fields[1] as String?,
      dateAdded: fields[2] as String?,
      dateLastUpdated: fields[3] as String?,
      deck: fields[4] as String?,
      description: fields[5] as String?,
      id: fields[6] as int?,
      imageModel: fields[7] as ImageModel,
      name: fields[8] as String?,
      siteDetailUrl: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CommonDataModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.aliases)
      ..writeByte(1)
      ..write(obj.apiDetailUrl)
      ..writeByte(2)
      ..write(obj.dateAdded)
      ..writeByte(3)
      ..write(obj.dateLastUpdated)
      ..writeByte(4)
      ..write(obj.deck)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.imageModel)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.siteDetailUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
