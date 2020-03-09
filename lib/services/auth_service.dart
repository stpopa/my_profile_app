import 'dart:async';
import 'dart:convert' as convert;

import 'package:endava_profile_app/models/api_response.dart';
import 'package:endava_profile_app/models/user.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:http/http.dart' as http;

class InvalidResponseError extends StateError {
  InvalidResponseError(String msg) : super(msg);
}

enum AuthPath { authenticate, signUp, me }

class AuthService {
  static const BASE_URL = 'https://dictionary-cloud.herokuapp.com';
  static const Map<AuthPath, String> paths = {
    AuthPath.authenticate: "/authenticate",
    AuthPath.signUp: "/signup",
    AuthPath.me: "/v1/me",
  };

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<String> authenticate(String email, String password) async {
    final url = BASE_URL + paths[AuthPath.authenticate];

    // Converts object to string
    final body = convert.json.encode({"email": email, "password": password});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      Map<String, dynamic> parsedResponse = convert.json.decode(response.body);

      var authToken = parsedResponse['auth_token'];
      await FlutterKeychain.put(key: 'authToken', value: authToken);

      return authToken;
    }

    throw InvalidResponseError(response.body);
  }

  Future<User> signUp(String email, String password, User user) async {
    final url = BASE_URL + paths[AuthPath.signUp];

    // Converts object to string
    final body = {
      "email": email,
      "password": password,
      "name": user.name,
      "role": user.role,
      "thumbnail": user.thumbnail
    };

    final response = await http.post(url, headers: headers, body: body);

    return _parseUserFrom(response);
  }

  Future<User> me() async {
    final url = BASE_URL + paths[AuthPath.me];

    String authToken = await FlutterKeychain.get(key: 'authToken');

    if (authToken == '')
      throw InvalidResponseError("User not autheticated");
    else
      headers.addAll({'Authorization': authToken});

    final response = await http.get(url, headers: headers);

    return _parseUserFrom(response);
  }

  User _parseUserFrom(http.Response response) {
    Map<String, dynamic> jsonFromBody = convert.json.decode(response.body);

    ApiResponse apiResponse = ApiResponse.fromJson(jsonFromBody);

    if (apiResponse.success) {
      Map<String, dynamic> userData = apiResponse.data;

      return User.fromJson(userData);
    }

    throw InvalidResponseError(response.body);
  }
}
