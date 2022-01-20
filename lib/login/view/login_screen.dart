import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/login/login.dart';
import 'package:watch_it/repository/authentication_repository/authentication_repository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
          );
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  "assets/images/wave_top.png",
                  width: MediaQuery.of(context).size.width,
                ),
                top: 0,
                left: 0,
              ),
              const Padding(padding: EdgeInsets.all(12), child: LoginForm()),
              Positioned(
                child: Image.asset("assets/images/wave_bottom.png"),
                bottom: 0,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
