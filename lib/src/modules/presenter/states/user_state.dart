import 'package:flutter_application/src/modules/domain/entities/user.dart';

abstract class UserState {}

class UserInitial extends UserState {
  final List<User> users;

  UserInitial(this.users);
}

class EmptyUserState extends UserInitial {
  EmptyUserState() : super([]);
}

class LoadingUserState extends UserState {}

class ErrorUserState extends UserState {
  final String message;

  ErrorUserState(this.message);
}
