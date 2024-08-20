import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class CoordinatesEntityValidator extends FormzInput<String, String> {
  const CoordinatesEntityValidator.pure([super.value = '']) : super.pure();
  const CoordinatesEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return S.current.coordinatesValidator;
    }
    if (value.length < 2 || value.length > 25) {
      return S.current.coordinatesValidator;
    }
    return null;
  }
}
