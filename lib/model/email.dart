import 'package:formz/formz.dart';
import 'package:email_validator/email_validator.dart';

enum EmailValidationError { empty, BadFormat }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (!EmailValidator.validate(value)) return EmailValidationError.BadFormat;
    return null;
  }
}
