import '../../infra/repositories/user_repository.dart';

abstract class GetUser {
  GetUser(Object object);

  Future<void> call(String name, String password);
}

class GetUserImpl implements GetUser {
  final UserRepository userRepository;

  GetUserImpl({
    required this.userRepository,
  });

  @override
  Future<void> call(String name, String password) async {
    return await userRepository.login(name, password);
  }
}
