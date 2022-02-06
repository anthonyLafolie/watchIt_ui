import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/profile/bloc/filter_bloc.dart';
import 'package:watch_it/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return FilterBloc()..add(FilterLoading());
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: ProfileView(),
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Container()),
        const Expanded(flex: 6, child: Filters()),
        const Expanded(flex: 3, child: Settings()),
      ],
    );
  }
}
