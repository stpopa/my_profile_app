class UserRepository {
  Future<void> persistUserToken(String token) async {
    // todo
    await Future.delayed(Duration(seconds: 2));
    return;
  }

  Future<bool> hasToken() async {
    // todo
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
