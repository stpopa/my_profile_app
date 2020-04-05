import 'dart:async';
import 'dart:convert' as convert;

import 'package:endava_profile_app/models/api_response.dart';
import 'package:endava_profile_app/models/item.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:http/http.dart' as http;

class InvalidResponseError extends StateError {
  InvalidResponseError(String msg) : super(msg);
}

enum ItemPath { item, items }

class ItemService {
  static const BASE_URL = 'https://dictionary-cloud.herokuapp.com';
  static const Map<ItemPath, String> paths = {
    ItemPath.item: "/v1/item",
    ItemPath.items: "/v1/items"
  };

  _getItemHeaders() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    String authToken = await FlutterKeychain.get(key: 'authToken');

    if (authToken == '') {
      throw InvalidResponseError('User not autheticated');
    } else {
      headers.addAll({'Authorization': authToken});
    }

    return headers;
  }

  Future<Item> add(Item item) async {
    final url = BASE_URL + paths[ItemPath.item];

    // Converts object to string
    String jsonString = convert.jsonEncode(item);

    final response = await http.post(url,
        headers: await _getItemHeaders(), body: jsonString);

    return _parseSingleItemIn(response);
  }

  Future<Item> delete(Item item) async {
    final url = BASE_URL + paths[ItemPath.item] + '/${item.key}';

    final response = await http.delete(url, headers: await _getItemHeaders());

    return _parseSingleItemIn(response);
  }

  Future<Item> post(String updatedItem) async {
    final url = BASE_URL + paths[ItemPath.item];

    final response = await http.post(url,
        headers: await _getItemHeaders(), body: updatedItem);

    return _parseSingleItemIn(response);
  }

  Future<Item> get(Item item) async {
    final url = BASE_URL + paths[ItemPath.item] + '/${item.key}';

    final response = await http.get(url, headers: await _getItemHeaders());

    return _parseSingleItemIn(response);
  }

  Future<List<Item>> getAll() async {
    final url = BASE_URL + paths[ItemPath.items];

    final response = await http.get(url, headers: await _getItemHeaders());

    return _parseMultipleItemsIn(response);
  }

  Future<List<Item>> deleteAll() async {
    final url = BASE_URL + paths[ItemPath.items];

    final response = await http.delete(url, headers: await _getItemHeaders());

    return _parseMultipleItemsIn(response);
  }

  List<Item> _parseMultipleItemsIn(http.Response response) {
    if (response.statusCode == 200) {
      List<dynamic> jsonItems = convert.jsonDecode(response.body)['data'];

      return jsonItems
          .map((i) => _getItemFromJson(i))
          .where((v) => null != v)
          .toList();
    }

    throw InvalidResponseError(response.body);
  }

  Item _parseSingleItemIn(http.Response response) {
    Map<String, dynamic> jsonFromBody = convert.json.decode(response.body);

    ApiResponse apiResponse = ApiResponse.fromJson(jsonFromBody);

    if (apiResponse.success) {
      Map<String, dynamic> itemData = apiResponse.data;

      return Item.fromJson(itemData);
    }

    throw InvalidResponseError(response.body);
  }

  Item _getItemFromJson(i) {
    try {
      return Item.fromJson(i);
    } catch (e) {
      print("Cannot convert $i");
      return null;
    }
  }
}
