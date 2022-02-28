import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:watch_it/screen/signup/signup.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _UsernameInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _EmailInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _PasswordInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _RememberMeCheckbox(),
          const Padding(padding: EdgeInsets.all(8)),
          _SignupButton(),
        ],
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('signupForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<SignupBloc>().add(SignupUsernameChanged(username)),
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
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('signupForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignupBloc>().add(SignupPasswordChanged(password)),
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

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signupForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<SignupBloc>().add(SignupEmailChanged(email)),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: state.email.invalid ? 'Email incorrect' : null,
          ),
        );
      },
    );
  }
}

class _RememberMeCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
          previous.rememberMe != current.rememberMe,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
                key: const Key('signupForm_rememberMe_checkBox'),
                value: state.rememberMe,
                onChanged: (rememberMe) {
                  FocusScope.of(context).unfocus();
                  context
                      .read<SignupBloc>()
                      .add(SignupRememberMeChanged(rememberMe!));
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

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('signupForm_continue_raisedButton'),
                child: const Text("S'inscrire"),
                onPressed: state.status.isValidated
                    ? () {
                        FocusScope.of(context).unfocus();
                        context.read<SignupBloc>().add(const SignupSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}
