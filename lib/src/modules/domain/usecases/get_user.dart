import '../../external/datasources/user_datasources.dart';
import '../repositories/user_repository.dart';

abstract class UserRepository {
  UserRepository (Object object);

  Future<void> call(String name, String password);

  static onPressedLogin(String text, String text2) {}

  static onPressedRegister(String text, String text2, String text3) {}
}
class UserRepositoryImpl implements IUserRepository {
  final UserDatasource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<void> authenticate(String username, String password) async {
    await userDataSource.authenticate(username, password);
  }
  
  @override
  Future<List> register(String name, String password, String passwordConfirmation) {        
    throw UnimplementedError();
  }
  
  @override
  Future<List> tasks() {
    throw UnimplementedError();
  }
  }
