import 'package:flutter_application/src/modules/domain/entities/user.dart';

class LoginAdpater {
  static User fromJson(Map json) => User(
        username: json['username'],
        password: json['password'],
      );
}
