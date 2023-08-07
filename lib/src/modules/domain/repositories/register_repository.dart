abstract class RegisterRepository {
  Future<void> register(String name, String password, String passwordConfirmation);
}