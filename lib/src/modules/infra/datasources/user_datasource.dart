abstract class IUserDataSource {
  Future<List> getUsers();

  login(String username, String password) {}

  Future<List<dynamic>> register(String name, String password, String passwordConfirmation) async {
    // ... lógica de registro ...

    // Retorne uma lista vazia como um exemplo
    return [];
  }
}