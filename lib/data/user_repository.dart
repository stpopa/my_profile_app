import 'package:flutter_keychain/flutter_keychain.dart';

class UserRepository {

  UserRepository._privateConstructor();
  static final UserRepository instance = UserRepository._privateConstructor();

  static const _TOKEN_KEY = "auth_token";

  Future<void> persistUserToken(String token) async {
    await FlutterKeychain.put(key: _TOKEN_KEY, value: token);
    return;
  }

  Future<String> fetchUserToken() async {
    final token = await FlutterKeychain.get(key: _TOKEN_KEY);
    return token;
  }

  Future<bool> hasToken() async {
    final token = await FlutterKeychain.get(key: _TOKEN_KEY);
    return token != null;
  }

  Future<void> deleteUserToken() async {
    await FlutterKeychain.remove(key: _TOKEN_KEY);
    return;
  }
}
