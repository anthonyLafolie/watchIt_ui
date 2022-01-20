part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.email = const Email.pure(),
      this.rememberMe = false});

  final FormzStatus status;
  final Username username;
  final Password password;
  final Email email;
  final bool rememberMe;

  SignupState copyWith(
      {FormzStatus? status,
      Username? username,
      Password? password,
      Email? email,
      bool? rememberMe}) {
    return SignupState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        rememberMe: rememberMe ?? this.rememberMe);
  }

  @override
  List<Object> get props => [status, username, password, email, rememberMe];
}
