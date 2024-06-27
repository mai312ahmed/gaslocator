import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

class EmailValidationField extends FormzInput<String, EmailValidationError> {
  const EmailValidationField.pure() : super.pure('');
  const EmailValidationField.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  @override
  EmailValidationError? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return EmailValidationError.empty;
    }
    if (!_emailRegex.hasMatch(value ?? '')) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}
