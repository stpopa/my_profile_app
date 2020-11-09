// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserList _$UserListFromJson(Map<String, dynamic> json) {
  return UserList(
    name: json['name'] as String,
    uniqKey: json['uniqKey'] as String,
    users: (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      'name': instance.name,
      'users': instance.users,
      'uniqKey': instance.uniqKey,
    };
