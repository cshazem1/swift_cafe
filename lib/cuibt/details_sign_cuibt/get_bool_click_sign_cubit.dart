import 'package:bloc/bloc.dart';

import 'get_bool_click_states.dart';

class GetBoolClickSignCubit extends Cubit<GetBoolClickButtonStates> {
  GetBoolClickSignCubit() : super(GetBoolLoginStates());
  bool login = false;
  bool signup = false;
  bool logInButton = true;

  getBool(bool button) {
    logInButton =
        button ? logInButton == logInButton : logInButton = !logInButton;

    logInButton ? emit(GetBoolLoginStates()) : emit(GetBoolSignUpStates());
    return logInButton;
  }
}
