import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:watch_it/common/exception/bad_credential_exception.dart';
import 'package:watch_it/common/user_storage.dart';
import 'package:watch_it/service/auth_service.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    late bool rememberMe;
    late String username;
    late String password;
    await UserStorage.getRememberMe().then((value) => rememberMe = value ?? false);
    if (rememberMe) {
      await UserStorage.getUsername().then((value) => username = value ?? "");
      await UserStorage.getPassword().then((value) => password = value ?? "");
      try {
        await logIn(username: username, password: password, rememberMe: rememberMe);
      } on BadCredentialException {
        yield AuthenticationStatus.unauthenticated;
      }
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn({required String username, required String password, required bool rememberMe}) async {
    Response response = await AuthService().login(username, password);
    switch (response.statusCode) {
      case 200:
        if (rememberMe) {
          UserStorage.setUsername(username);
          UserStorage.setPassword(password);
        }
        UserStorage.setRememberMe(rememberMe);
        UserStorage.setToken(jsonDecode(response.body)["token"]);
        _controller.add(AuthenticationStatus.authenticated);
        break;
      case 404:
      default:
        throw BadCredentialException("Login or password are incorrect");
    }
  }

  void logOut() {
    UserStorage.deleteUsername();
    UserStorage.deletePassword();
    UserStorage.deleteRememberMe();
    UserStorage.deleteToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
