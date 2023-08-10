abstract class IUserDataSource {
  Future<void> authenticate(String username, String password);

  login(String username, String password) {}

  getUsers() {}

  Future<List<dynamic>> register(String name, String password, String passwordConfirmation) {
    throw UnimplementedError();
  }
}
