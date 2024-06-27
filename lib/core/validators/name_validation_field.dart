import 'package:formz/formz.dart';

enum NameValidationError { invalid, empty, short }

class NameValidationField extends FormzInput<String, NameValidationError> {
  const NameValidationField.pure() : super.pure('');
  const NameValidationField.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return NameValidationError.empty;
    }

    if (value!.length < 3) {
      return NameValidationError.short;
    }
    return null;
  }
}
