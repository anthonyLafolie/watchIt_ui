import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:watch_it/screen/login/login.dart';
import 'package:watch_it/screen/signup/view/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(
                  "Nom d'utilisateur ou mot de passe incorrect",
                ),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -2 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(8)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(8)),
            _RememberMeCheckbox(),
            _LoginButton(),
            const Padding(padding: EdgeInsets.all(12)),
            _SignUpText(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: "Nom d'utilisateur",
            errorText:
                state.username.invalid ? "Nom d'utilisateur incorrect" : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Mot de passe',
            errorText: state.password.invalid ? 'Mot de passe incorrect' : null,
          ),
        );
      },
    );
  }
}

class _RememberMeCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.rememberMe != current.rememberMe,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
                key: const Key('loginForm_rememberMe_checkBox'),
                value: state.rememberMe,
                onChanged: (rememberMe) {
                  FocusScope.of(context).unfocus();
                  context
                      .read<LoginBloc>()
                      .add(LoginRememberMeChanged(rememberMe!));
                }),
            const Text.rich(
              TextSpan(
                text: "Se souvenir de moi ?",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('Se connecter'),
                onPressed: state.status.isValidated
                    ? () {
                        FocusScope.of(context).unfocus();
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}

class _SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text.rich(
        TextSpan(
            text: "Vous n’avez pas de compte ?  ",
            style: const TextStyle(fontSize: 14),
            children: [
              TextSpan(
                  text: "Inscrivez-vous",
                  style: const TextStyle(color: Colors.blue, fontSize: 14),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context, SignupScreen.route());
                    }),
            ]),
      )
    ]);
  }
}
