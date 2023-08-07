import 'package:flutter_application/src/modules/domain/entities/register_user.dart';

class RegisterAdapter {
  RegisterAdapter._();

  static RegisterUser fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      name: json['name'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
    );
  }
}
