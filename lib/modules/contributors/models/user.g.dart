// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    login: json['login'] as String,
    avatarUrl: json['avatar_url'] as String,
    name: json['name'] as String,
    company: json['company'] as String,
    location: json['location'] as String,
    email: json['email'] as String,
    bio: json['bio'] as String,
  )..contributions = json['contributions'] as int;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'company': instance.company,
      'location': instance.location,
      'email': instance.email,
      'bio': instance.bio,
      'contributions': instance.contributions,
    };
