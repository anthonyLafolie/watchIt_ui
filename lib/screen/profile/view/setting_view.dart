import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:watch_it/authentication/authentication.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
                  flex: 3,
                  child: _DarkModeSwitch(),
                ),
                Expanded(
                  flex: 3,
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
                const Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _DeleteAccount(),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
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

class _DeleteAccount extends StatelessWidget {
  const _DeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: const Text(
          "Supprimer mon compte",
          style: TextStyle(color: Colors.red, fontSize: 14),
        ),
        onTap: () => {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: const Text(
                      "Voulez-vous vraiment supprimer votre compte ?"),
                  // actionsAlignment: MainAxisAlignment.spaceEvenly,
                  actionsPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Annuler'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Accepter'),
                    ),
                  ],
                ),
              )
            });
  }
}
