import 'package:flutter_application/src/modules/domain/entities/register.dart';

class RegisterAdapter {
  RegisterAdapter._();

  static Register fromJson(Map<String, dynamic> json) {
    return Register(
      name: json['name'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
    );
  }
}
