import 'package:flutter_application/src/modules/infra/datasources/register_datasource.dart';
import 'package:flutter_application/src/modules/infra/datasources/tasks_datasource.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';

class UserRepository extends IUserRepository {
  final IUserDataSource userDatasource;
  final IRegisterDataSource registerDatasource;
  final ITasksDataSource tasksDatasource;

  UserRepository(this.userDatasource, this.registerDatasource, this.tasksDatasource);

  @override
  Future<void> login(String username, String password) async {
    await userDatasource.login(username, password);
  }

  @override
  Future<void> register(String name, String password, String passwordConfirmation) async {
    await registerDatasource.register(name, password, passwordConfirmation);
  }

  @override
  Future<List> getUser() async {
    return await userDatasource.getUser();
  }

  @override
  Future<List> getTasks() async {
    return await tasksDatasource.getTasks();
  }
}
