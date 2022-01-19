import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:watch_it/authentication/bloc/authentication_bloc.dart';
import 'package:watch_it/common/user_storage.dart';

// ignore: must_be_immutable
class Page2 extends StatefulWidget {
  Color color;
  Page2({Key? key, required this.color}) : super(key: key);

  static Route route(Color color) {
    return MaterialPageRoute<void>(
        builder: (_) => Page2(
              color: color,
            ));
  }

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String username = "";

  String password = "";

  String token = "";

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    UserStorage.getUsername().then((value) {
      setState(() {
        username = value!;
      });
    });
    UserStorage.getPassword().then((value) {
      setState(() {
        password = value!;
      });
    });
    UserStorage.getRememberMe().then((value) {
      setState(() {
        rememberMe = value!;
      });
    });
    UserStorage.getToken().then((value) {
      setState(() {
        token = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username : $username",
            ),
            Text(
              "Password : $password",
            ),
            Text(
              "Remember Me :  $rememberMe",
            ),
            Text(
              "Token : $token",
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Logout'),
                onPressed: () async {
                  context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
