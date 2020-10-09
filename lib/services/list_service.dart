import 'dart:async';
import 'dart:convert' as convert;

import 'package:endava_profile_app/models/api_response.dart';
import 'package:endava_profile_app/models/user.dart';
import 'package:endava_profile_app/models/user_list.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class InvalidResponseError extends StateError {
  InvalidResponseError(String msg) : super(msg);
}

enum ListPath { create, destroy, update, show_all, get_list }

class ListService {
  static const BASE_URL = 'https://dictionary-cloud.herokuapp.com';
//  static const BASE_URL = 'http://localhost:3000';

  static const Map<ListPath, String> paths = {
    ListPath.create: "/v1/list",
    ListPath.destroy: "/v1/list/%s",
    ListPath.update: "/v1/list/%s",
    ListPath.show_all: "/v1/list",
    ListPath.get_list: "/v1/list/%s",
  };

  String getShareUrl(UserList userList) {
    return sprintf(BASE_URL + paths[ListPath.get_list], [userList.uniqKey]);
  }

  Future<UserList> create(UserList list) async {
    final url = BASE_URL + paths[ListPath.create];

    final body = {
      'name': list.name,
      'user_samples': _mapUsersToSamples(list.users)
    };

    final response = await http.post(
      url,
      headers: await _getHeaders(),
      body: convert.json.encode(body),
    );

    return _parseSingleListIn(response);
  }

  Future<bool> destroy(UserList list) async {
    final url = sprintf(BASE_URL + paths[ListPath.destroy], [list.uniqKey]);

    final response = await http.delete(url, headers: await _getHeaders());
    ApiResponse apiResponse = _parseResponse(response);

    return apiResponse.success;
  }

  Future<UserList> update(UserList list) async {
    final url = sprintf(BASE_URL + paths[ListPath.update], [list.uniqKey]);

    final body = {
      'name': list.name,
      'user_samples': _mapUsersToSamples(list.users),
    };

    final response = await http.post(
      url,
      headers: await _getHeaders(),
      body: convert.json.encode(body),
    );

    return _parseSingleListIn(response);
  }

  Future<UserList> get(String listKey) async {
    final url = sprintf(BASE_URL + paths[ListPath.get_list], [listKey]);

    final response = await http.get(url, headers: await _getHeaders());

    return _parseSingleListIn(response);
  }

  Future<List<UserList>> showAll() async {
    final url = BASE_URL + paths[ListPath.show_all];

    final response = await http.get(url, headers: await _getHeaders());

    ApiResponse apiResponse = _parseResponse(response);

    try {
      if (apiResponse.success) {
        List<dynamic> listArray = apiResponse.data;

        return listArray
            .map((list) => UserList.fromJson(list as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      print(e);
      throw e;
    }

    throw InvalidResponseError(response.body);
  }

  List<Map<String, dynamic>> _mapUsersToSamples(List<User> users) {
    return users
        .map((user) => {
              "user_uniq_key": user.uniqKey,
              "selected": user.selected,
            })
        .toList();
  }

  UserList _parseSingleListIn(http.Response response) {
    ApiResponse apiResponse = _parseResponse(response);

    if (apiResponse.success) {
      Map<String, dynamic> data = apiResponse.data;

      return UserList.fromJson(data);
    }

    throw InvalidResponseError(response.body);
  }

  ApiResponse _parseResponse(http.Response response) {
    Map<String, dynamic> jsonFromBody = convert.json.decode(response.body);

    return ApiResponse.fromJson(jsonFromBody);
  }

  _getHeaders() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    String authToken = await FlutterKeychain.get(key: 'authToken');

    if (authToken == '') {
      throw InvalidResponseError('User not autheticated');
    } else {
      headers.addAll({'Authorization': authToken});
    }

    return headers;
  }
}
