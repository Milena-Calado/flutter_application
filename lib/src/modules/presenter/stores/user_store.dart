import 'package:flutter/cupertino.dart';

import '../states/user_state.dart';

class UserStore extends ValueNotifier<UserState> {
  UserStore(Object object) : super(EmptyUserState());

  void loading() => value = LoadingUserState();

  void error(String message) => value = ErrorUserState(message);

  void empty() => value = EmptyUserState();

  void clear() => value = EmptyUserState();

  }



