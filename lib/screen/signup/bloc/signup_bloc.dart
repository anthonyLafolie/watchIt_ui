import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:watch_it/common/exception/bad_credential_exception.dart';
import 'package:watch_it/common/exception/conflit_exception.dart';
import 'package:watch_it/repository/authentication_repository/authentication_repository.dart';
import 'package:watch_it/screen/signup/signup.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const SignupState()) {
    on<SignupUsernameChanged>(_onUsernameChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupRememberMeChanged>(_onRememberMeChanged);
    on<SignupSubmitted>(_onSubmitted);
  }
  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
      SignupUsernameChanged event, Emitter<SignupState> emit) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, state.email, username]),
    ));
  }

  void _onPasswordChanged(
      SignupPasswordChanged event, Emitter<SignupState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email, state.username]),
    ));
  }

  void _onEmailChanged(SignupEmailChanged event, Emitter<SignupState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email, state.username]),
    ));
  }

  void _onRememberMeChanged(
      SignupRememberMeChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      rememberMe: event.rememberMe,
      status: Formz.validate([state.password, state.username]),
    ));
  }

  void _onSubmitted(SignupSubmitted event, Emitter<SignupState> emit) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authenticationRepository.signup(
            username: state.username.value,
            email: state.email.value,
            password: state.password.value,
            rememberMe: state.rememberMe);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on BadCredentialException {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage:
                "Nom d'utilisateur, email ou mot de passe incorrect"));
      } on ConflitException {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: "Nom d'utilisateur ou email déjà utilisé"));
      }
    }
  }
}
