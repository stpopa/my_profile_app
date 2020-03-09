import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(nullable: true)
class Item {
  String key;
  dynamic value;

  Item({
    this.key,
    this.value,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
