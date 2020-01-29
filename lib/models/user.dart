import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class User {
  String name;
  String role;
  String thumbnail;

  User({
    this.name,
    this.role,
    this.thumbnail,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
