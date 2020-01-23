// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contributor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contributor _$ContributorFromJson(Map<String, dynamic> json) {
  return Contributor(
    url: json['url'] as String,
    contributions: json['contributions'] as int,
  );
}

Map<String, dynamic> _$ContributorToJson(Contributor instance) =>
    <String, dynamic>{
      'url': instance.url,
      'contributions': instance.contributions,
    };
