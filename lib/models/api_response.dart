import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(nullable: true)
class ApiResponse {
  bool success;
  dynamic data;

  ApiResponse({
    this.success,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
