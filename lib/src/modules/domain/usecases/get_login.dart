import '../repositories/login_repository.dart';

abstract class GetLogin {
  Future<void> call(String name, String password);
}

class GetLoginImpl implements GetLogin {
  final LoginRepository loginRepository;

  GetLoginImpl({
    required this.loginRepository,
  });

  @override
  Future<void> call(String name, String password) async {
    await loginRepository.login(name, password);
  }
}