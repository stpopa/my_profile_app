import 'dart:convert';

import 'package:endava_profile_app/data/user_repository.dart';

import 'DomainExperience.dart';
import 'package:http/http.dart' as http;

class DomainExpRepository {
  static const _BASE_URL = 'https://dictionary-cloud.herokuapp.com';
  static const _ENDPOINT = '/v1/item';
  static const _CATEGORY_KEY = 'experiences';

  List<DomainExperience> initialData = [];
  List<DomainExperience> domainExperiences = [];

  Future<http.Response> saveDomainExperiences() async {

    final authToken = await UserRepository.instance.fetchUserToken();

    return http.post(
      _BASE_URL + _ENDPOINT,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': authToken,
      },
      body: jsonEncode({
        "key": _CATEGORY_KEY,
        "value": domainExperiences,
      }),
    );
  }
}
