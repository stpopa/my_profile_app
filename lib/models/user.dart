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

  factory User.fromJson(Map<String, dynamic> json) {
    // Map from user_sample
    if (json['user'] != null) {
      json['user']['selected'] = json['selected'];

      return _$UserFromJson(json['user']);
    }

    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [uniqKey, selected];

  bool get isModerator => accountType == 'moderator';


  User copy() {
    return User.fromJson(this.toJson());
  }

  User copyWith({
    String name,
    String role,
    String thumbnail,
    String accountType,
    bool selected,
  }) {
    return User(
        name: name ?? this.name,
        role: role ?? this.role,
        thumbnail: thumbnail ?? this.thumbnail,
        accountType: accountType ?? this.accountType,
        uniqKey: this.uniqKey,
        selected: selected ?? this.selected);
  }
}
