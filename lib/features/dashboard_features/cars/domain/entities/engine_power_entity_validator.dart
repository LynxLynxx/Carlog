import 'package:carlog/generated/l10n.dart';
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
      return S.current.enginePowerValidator;
    }
    return null;
  }
}
