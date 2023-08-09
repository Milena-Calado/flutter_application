import 'package:flutter_application/src/modules/infra/datasources/register_datasource.dart';
import 'package:flutter_application/src/modules/infra/datasources/tasks_datasource.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';

abstract class UserRepository extends IUserRepository {
  final IUserDataSource userDatasource;
  final IRegisterDataSource registerDatasource;
  final ITasksDataSource tasksDatasource;

  UserRepository(this.userDatasource, this.registerDatasource, this.tasksDatasource);

  Future<void> login(String username, String password) async {
    await userDatasource.login(username, password);
  }
 @override
  Future<List<dynamic>> register(String name, String password, String passwordConfirmation) {
    return userDatasource.register(name, password, passwordConfirmation);
  }

  Future<List> getUser() async {
    return await userDatasource.getUsers();
  }

  Future<List> getTasks() async {
    return await tasksDatasource.getTasks();
  }
}
