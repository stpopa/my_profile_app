import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class DomainExperience {
  String id;
  String title;
  String details;

  DomainExperience() : this.id = Uuid().v4();

  DomainExperience.from({
    @required this.title,
    @required this.details,
  }) : this.id = Uuid().v4();

  DomainExperience.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        details = json['details'];

  Map toJson() => {
    'id': id,
    'title': title,
    'details': details
  };
}
