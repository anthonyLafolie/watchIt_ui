import 'package:flutter/material.dart';
import 'package:watch_it/app.dart';

import 'repository/authentication_repository/authentication_repository.dart';
import 'repository/user_repository/user_repository.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
