// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    role: json['role'] as String,
    thumbnail: json['thumbnail'] as String,
    accountType: json['account_type'] as String,
    uniqKey: json['uniq_key'] as String,
    selected: json['selected'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'thumbnail': instance.thumbnail,
      'account_type': instance.accountType,
      'uniq_key': instance.uniqKey,
      'selected': instance.selected,
    };
