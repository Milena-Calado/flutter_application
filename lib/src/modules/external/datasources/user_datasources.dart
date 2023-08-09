
import 'package:flutter_application/src/modules/domain/error/errors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../infra/datasources/user_datasource.dart';

abstract class UserDatasource implements IUserDataSource {
  final Uno uno;
  final SharedPreferences _prefs;

  UserDatasource(this.uno, this._prefs);

  Future<List> getUser() async {
    // Verifique se o usuário já está salvo no SharedPreferences
    final savedUser = _prefs.getStringList('user');

    if (savedUser != null) {
      return savedUser;
    }

    try {
      final response = await uno.get('/user');
      final user = response.data;

      // Salve o usuário no SharedPreferences
      await _prefs.setStringList('user', user.cast<String>());

      return user;
    } catch (e) {
      throw DataSourceLoginException('Failed to fetch user: $e');
    }
  }
}

class Uno {
  get(String s) {}
}

