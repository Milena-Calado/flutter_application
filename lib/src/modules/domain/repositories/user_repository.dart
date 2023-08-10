abstract class IUserRepository {
  Future<void> authenticate(String username, String password);
  Future<List> register(String name, String password, String passwordConfirmation);
  Future<List> tasks();
}