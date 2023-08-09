// import 'package:flutter_application/src/modules/external/datasources/register_datasources.dart';
// import 'package:flutter_application/src/modules/presenter/pages/user.dart';
// import 'package:flutter_application/src/modules/presenter/stores/user_store.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:dio/dio.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import 'src/modules/domain/usecases/get_user.dart';
// import 'src/modules/external/datasources/task_datasources.dart';
// import 'src/modules/external/datasources/user_datasources.dart';
// import 'src/modules/presenter/pages/register.dart';

// class UserModule extends Module {
//   @override
//   List<Bind> get binds => [
//         //utils
//         Bind.factory((i) => Uno()),
//         //datasources
//         Bind.factory<IUserDataSource>((i) => UserDataSource(i())),
//         Bind.factory<ITasksDataSource>((i) => TasksDataSource(i())),
//         Bind.factory<IRegisterDataSource>((i) => RegisterDataSource(i())),
//         //repository
//         Bind.factory<IUserRepository>((i) => UserRepository(i(), i(), i())),
//         //usecases
//         Bind.factory((i) => GetUser(i())),
//         Bind.factory((i) => GetTasks(i())),
//         //stores
//         Bind.singleton((i) => UserStore(i())),
//       ];

//   @override
//   List<ModularRoute> get routes => [
//         ChildRoute('/', child: (_, args) => const LoginPage()),
//         ChildRoute('/register', child: (_, args) => const RegistrationPage()),
      
//       ];
// }
