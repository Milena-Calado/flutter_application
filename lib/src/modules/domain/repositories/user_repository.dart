abstract class IUserRepository {
  Future<List> user(String name, String password);
  Future<List> register(String name, String password, String passwordConfirmation);
  Future<List> tasks();
}