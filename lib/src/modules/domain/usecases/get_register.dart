import '../repositories/register_repository.dart';

abstract class GetRegister {
  Future<void> call(String name, String password, String passwordConfirmation);
}

class GetRegisterImpl implements GetRegister {
  final RegisterRepository registerRepository;

  GetRegisterImpl({
    required this.registerRepository,
  });

  @override
  Future<void> call(String name, String password, String passwordConfirmation) async {
    await registerRepository.register(name, password, passwordConfirmation);
  }
}