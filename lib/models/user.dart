import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class User extends Equatable {
  final String name;
  final String role;
  final String thumbnail;

  @JsonKey(name: 'account_type')
  final String accountType;

  @JsonKey(name: 'uniq_key')
  final String uniqKey;
  final bool selected;

  User({
    this.name,
    this.role,
    this.thumbnail,
    this.accountType,
    this.uniqKey,
    this.selected = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [uniqKey];

  bool get isModerator => accountType == 'moderator';

  User copy() {
    return User.fromJson(this.toJson());
  }
}
