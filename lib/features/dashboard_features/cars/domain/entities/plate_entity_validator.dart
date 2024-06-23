import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class PlateEntityValidator extends FormzInput<String, String> {
  const PlateEntityValidator.pure([super.value = '']) : super.pure();
  const PlateEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.length < 2 || value.length > 20) {
      return S.current.carPlateValidator;
    }
    return null;
  }
}
