import 'package:flutter/cupertino.dart';

import '../states/user_state.dart';

class UserStore extends ValueNotifier<UserState> {
  UserStore(Object object) : super(EmptyUserState());

  void loading() => value = LoadingUserState();

  void error(String message) => value = ErrorUserState(message);

  void initial(List users) => value = UserInitial(users);

  void empty() => value = EmptyUserState();

  void update(List users) => value = UserInitial(users);

  void clear() => value = EmptyUserState();

  @override
  void dispose() {
    value = null;
    super.dispose();
  }

}

