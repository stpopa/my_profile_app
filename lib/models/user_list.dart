import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'user.dart';

part 'user_list.g.dart';

@JsonSerializable(nullable: true)
class UserList extends Equatable {
  final String name;
  final List<User> users;

  @JsonKey(name: 'uniq_key')
  final String uniqKey;

  UserList({this.name, this.uniqKey, this.users});

  factory UserList.fromJson(Map<String, dynamic> json) => _$UserListFromJson(json);

  Map<String, dynamic> toJson() => _$UserListToJson(this);

  @override
  List<Object> get props => [name, users, uniqKey];

  UserList copy() {
    return UserList.fromJson(this.toJson());
  }
}
