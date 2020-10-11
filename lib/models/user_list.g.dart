// HAND WRITTEN CODE.

part of 'user_list.dart';

UserList _$UserListFromJson(Map<String, dynamic> json) {
  return UserList(
    name: json['name'] as String,
    uniqKey: json['uniq_key'] as String,
    users: json['users']
        .map<User>((data) {
          Map<String, dynamic> jsonUser = data['user'];
          jsonUser.addAll({'selected': data['selected']});

          return User.fromJson(jsonUser);
        }).toList(),
  );
}

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      'name': instance.name,
      'uniq_key': instance.uniqKey,
      'users': instance.users.map((e) => e.toJson()),
    };
