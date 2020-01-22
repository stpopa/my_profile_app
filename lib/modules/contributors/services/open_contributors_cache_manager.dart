import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class OpenContributorsCacheManager extends BaseCacheManager {
  static const key = "open-contributors-cache";
  static const maxCacheDuration = Duration(days: 1);

  static OpenContributorsCacheManager _instance;

  factory OpenContributorsCacheManager() {
    if (_instance == null) {
      _instance = new OpenContributorsCacheManager._();
    }
    return _instance;
  }

  OpenContributorsCacheManager._()
      : super(key,
            maxAgeCacheObject: maxCacheDuration,
            maxNrOfCacheObjects: 10,
            fileFetcher: _customHttpGetter);

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return path.join(directory.path, key);
  }

  static Future<FileFetcherResponse> _customHttpGetter(String url,
      {Map<String, String> headers}) async {
    // Do things with headers, the url or whatever.
    return HttpFileFetcherResponse(await http.get(url, headers: headers));
  }
}
