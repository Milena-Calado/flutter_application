import 'package:shared_preferences/shared_preferences.dart'; // Certifique-se de importar a biblioteca correta

import '../../infra/datasources/register_datasource.dart';

class RegisterDataSource implements IRegisterDataSource {
  final int uno;
  final SharedPreferences _prefs;

  RegisterDataSource(this.uno, this._prefs);

  @override
  Future<List> register(String name, String password, String passwordConfirmation) async {
    // Verifique se a senha e a confirmação de senha correspondem
    if (password != passwordConfirmation) {
      throw ArgumentError('Passwords do not match');
    }

    // Salve os dados de login no SharedPreferences
    await _prefs.setString('name', name);
    await _prefs.setString('password', password);

    return [name, password, passwordConfirmation];
  }

  Future<bool> isLoggedIn() async {
    final savedName = _prefs.getString('name');
    final savedPassword = _prefs.getString('password');

    // Verifique se os dados de login foram salvos no SharedPreferences
    return savedName != null && savedPassword != null;
  }
}


