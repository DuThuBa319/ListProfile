import 'dart:async';

import 'package:login/src/resource/Login_Page.dart';
import 'package:login/src/validators/validation.dart';

class LoginBloc {
  // bien controller
  StreamController usernameController = StreamController();
  StreamController passwordController = StreamController();
  // stream
  Stream get UsernameStream => usernameController.stream;
  Stream get PasswordStream => passwordController.stream;
  // ham logic
  bool IsValidInfo(String username, String password) {
    if (Validators.IsValidUsername(username) == false) {
      usernameController.sink.addError("Tài khoản không hợp lệ.");
      return false;
    }
    if (Validators.IsValidPassword(password) == false) {
      passwordController.sink.addError("Mật khẩu phải trên 6 ký tự.");
      return false;
    }

    usernameController.sink.add('OK');
    passwordController.sink.add('OK');
    return true;
  }

//dispose
  void dispose() {
    usernameController.close();
    passwordController.close();
  }
}
