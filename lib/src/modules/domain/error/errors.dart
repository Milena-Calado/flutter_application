abstract class LoginException {
  final String message;
  final StackTrace? stackTrace;

  const LoginException({this.message = 'Dados Invalidos', this.stackTrace});

}

class ArgumentErrorLoginException extends LoginException {
  const ArgumentErrorLoginException({StackTrace? stackTrace}) : super(message: 'Argumento inválido', stackTrace: stackTrace);
}

class DataSourceLoginException extends LoginException {
  const DataSourceLoginException(String string, StackTrace s, {StackTrace? stackTrace}) : super(message: 'Erro ao acessar o banco de dados', stackTrace: stackTrace);
}

class LoginExceptionImpl extends LoginException {
  const LoginExceptionImpl({StackTrace? stackTrace, required String code, required String message, required String title}) : super(message: 'Erro ao realizar login', stackTrace: stackTrace);
}