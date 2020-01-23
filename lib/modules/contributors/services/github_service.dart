import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../models/contributor.dart';
import '../models/user.dart';
import 'open_contributors_cache_manager.dart';

class InvalidResponseError extends StateError {
  InvalidResponseError(String msg) : super(msg);
}

class GithubService {
  static const BASE_URL = 'https://api.github.com';
  static const CREDENTIALS = '?client_id=2a73a1450d7b195e0d62&client_secret=29e82f1e6ad8a081d47fcf0a338b772b98166388';

  final OpenContributorsCacheManager cacheManager = OpenContributorsCacheManager();

  Future<List<Contributor>> fetchContributors(String repo) async {
    final urlWithCredentials = BASE_URL + '/repos/' + repo + '/contributors' + CREDENTIALS;

    // Fetch the cached file
    var cachedFile = await cacheManager.getFileFromCache(urlWithCredentials);

    // if the file is not cached download it.
    if (cachedFile == null) {
      cachedFile = await cacheManager.downloadFile(urlWithCredentials);
    }

    if (cachedFile != null) {
      final jsonObject = convert.jsonDecode(cachedFile.file.readAsStringSync()) as List<dynamic>;

      return jsonObject.map((object) => Contributor.fromJson(object)).toList();
    }

    throw InvalidResponseError("The status code isn't 200");
  }

  Future<DateTime> fetchCacheExpirationFor(String repo) async {
    final urlWithCredentials = BASE_URL + '/repos/' + repo + '/contributors' + CREDENTIALS;

    // Fetch the cached file
    final cachedFile = await cacheManager.getFileFromCache(urlWithCredentials);

    return cachedFile.validTill.add(OpenContributorsCacheManager.maxCacheDuration);
  }

  Future<User> fetchUser(String url) async {
    var urlWithCredentials = url + CREDENTIALS;

    // Fetch the cached file
    var cachedFile = await cacheManager.getFileFromCache(urlWithCredentials);

    // if the file is not cached download it.
    if (cachedFile == null) {
      cachedFile = await cacheManager.downloadFile(urlWithCredentials);
    }

    if (cachedFile != null) {
      final jsonObject = convert.jsonDecode(cachedFile.file.readAsStringSync());

      return User.fromJson(jsonObject as Map<String, dynamic>);
    }

    throw InvalidResponseError("The status code isn't 200");
  }
}
