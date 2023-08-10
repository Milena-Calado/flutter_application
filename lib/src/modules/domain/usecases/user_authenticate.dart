import 'package:flutter_application/src/modules/domain/error/errors.dart';

import '../repositories/user_repository.dart';

abstract class AuthenticateUserUseCase {
  AuthenticateUserUseCase(String text, String text2);

  Future<void> call(String username, String password);
  
}

class AuthenticateUserUseCaseImpl implements AuthenticateUserUseCase {
  final IUserRepository userRepository;

  AuthenticateUserUseCaseImpl(this.userRepository);

  @override
  Future<void> call(String username, String password) async {
    if (username == '' || password == '') {
      throw const LoginExceptionImpl(
          message: 'Credenciais inválidas',
          title: 'Erro ao realizar login',
          code: 'login-exception');

    }

    // Realize a autenticação usando o UserRepository
    await userRepository.authenticate(username, password);
  }
}


