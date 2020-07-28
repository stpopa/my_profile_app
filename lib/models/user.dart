import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class User extends Equatable {
  String name;
  String role;
  String thumbnail;

  @JsonKey(name: 'account_type')
  String accountType;

  @JsonKey(name: 'uniq_key')
  String uniqKey;

  User({this.name, this.role, this.thumbnail, this.accountType, this.uniqKey});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [name, role, thumbnail, accountType, uniqKey];
}
