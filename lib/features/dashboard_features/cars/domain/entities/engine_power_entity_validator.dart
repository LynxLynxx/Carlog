import 'package:formz/formz.dart';

class EnginePowerEntityValidator extends FormzInput<String, String> {
  const EnginePowerEntityValidator.pure([super.value = '']) : super.pure();
  const EnginePowerEntityValidator.dirty({String value = ''})
      : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.length > 4) {
      return 'Engine power should be between 1 and 4 digits';
    }
    return null;
  }
}
