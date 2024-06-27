import 'package:formz/formz.dart';

class PasswordValidationField extends FormzInput<String, String> {
  const PasswordValidationField.pure() : super.pure('');
  const PasswordValidationField.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'الرجاء ادخال كلمة المرور';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب ان تكون اكثر من 8 احرف';
    }
    return null;
  }
}
