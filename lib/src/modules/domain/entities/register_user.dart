class RegisterUser {
  String name;
  String password;
  String passwordConfirmation;

  RegisterUser({
    required this.name,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}
