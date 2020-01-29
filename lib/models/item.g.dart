// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    key: json['key'] as String,
    value: json['value'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
