import '../../infra/datasources/register_datasource.dart';

class RegisterDataSource implements IRegisterDataSource {
  final int uno;

  RegisterDataSource(this.uno);

  @override
  Future<List> register(String name, String password, String passwordConfirmation) async {
    if (name == 'admin' && password == 'admin' && passwordConfirmation == 'admin') {
      return [name, password, passwordConfirmation];
    } else {
      throw ArgumentError('Invalid registration data');
    }
  }
}


