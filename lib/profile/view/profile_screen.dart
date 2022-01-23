import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:watch_it/authentication/authentication.dart';
import 'package:watch_it/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: ProfileView(),
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
        Expanded(flex: 2, child: Container()),
        Expanded(flex: 4, child: Container()),
        const Expanded(flex: 4, child: Setting()),
      ],
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Text("Paramètres",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: _DarkModeSwitch(),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: const Text(
                        "Se déconnecter",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                      onTap: () => context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested()),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        child: const Text(
                          "Supprimer mon compte",
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        onTap: () => {}),
                  ),
                ),
                Expanded(flex: 4, child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DarkModeSwitch extends StatelessWidget {
  const _DarkModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.themeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Mode sombre",
          style: TextStyle(fontSize: 14),
        ),
        Switch(
          value: themeProvider.id == "dark",
          onChanged: (value) {
            ThemeProvider.controllerOf(context).nextTheme();
          },
        ),
      ],
    );
  }
}
