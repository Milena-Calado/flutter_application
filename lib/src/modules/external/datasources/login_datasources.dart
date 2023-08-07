import 'package:flutter_application/src/modules/infra/datasources/login_datasource.dart';

class LoginDatasource implements ILoginDataSource {
  final int uno;

  LoginDatasource(this.uno);

  Future<List> login(String name, String password) async {
    if (name == 'admin' && password == 'admin') {
      return [name, password];
    } else {
      throw ArgumentError();
    }
  }
  
  @override
  Future<List> getLogin() {
    // TODO: implement getLogin
    throw UnimplementedError();
  }
  }
 