import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:watch_it/authentication/bloc/authentication_bloc.dart';

// ignore: must_be_immutable
class Page2 extends StatelessWidget {
  Color color;
  Page2({Key? key, required this.color}) : super(key: key);

  static Route route(Color color) {
    return MaterialPageRoute<void>(
        builder: (_) => Page2(
              color: color,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ElevatedButton(
        child: const Text('Logout'),
        onPressed: () {
          context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
        },
      ),
    );
  }
}
