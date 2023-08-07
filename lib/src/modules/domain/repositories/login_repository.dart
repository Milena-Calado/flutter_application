abstract class LoginRepository {
  Future<void> login(String name, String password);
  Future<void> register(String name, String password, String passwordConfirmation);
  Future<void> logout();

}