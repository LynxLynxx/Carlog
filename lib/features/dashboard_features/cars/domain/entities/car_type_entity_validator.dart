import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class CarTypeEntityValidator extends FormzInput<String, String> {
  const CarTypeEntityValidator.pure([super.value = '']) : super.pure();
  const CarTypeEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.length < 2 || value.length > 15) {
      return S.current.carTypeValidator;
    }
    return null;
  }
}
