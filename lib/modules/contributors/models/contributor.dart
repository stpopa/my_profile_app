import 'package:json_annotation/json_annotation.dart';

part 'contributor.g.dart';

@JsonSerializable(nullable: true)
class Contributor {
  String url;
  int contributions;

  Contributor({this.url, this.contributions});

  factory Contributor.fromJson(Map<String, dynamic> json) => _$ContributorFromJson(json);

  Map<String, dynamic> toJson() => _$ContributorToJson(this);
}
