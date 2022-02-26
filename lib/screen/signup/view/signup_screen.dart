import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/repository/authentication_repository/authentication_repository.dart';
import 'package:watch_it/screen/signup/signup.dart';
import 'package:watch_it/screen/signup/view/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) {
            return SignupBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            child: SignupForm(),
          ),
        ),
      ),
    );
  }
}
