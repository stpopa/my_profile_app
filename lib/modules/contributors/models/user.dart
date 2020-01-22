import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class User {
  String login;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  String name;
  String company;
  String location;
  String email;
  String bio;
  int contributions = 0;

  User({
    this.login,
    this.avatarUrl,
    this.name,
    this.company,
    this.location,
    this.email,
    this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
