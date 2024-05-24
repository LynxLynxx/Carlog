import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class PlateEntityValidator extends FormzInput<String, String> {
  const PlateEntityValidator.pure() : super.pure('');
  const PlateEntityValidator.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if ((value.isEmpty || value.length > 20) && value.isNotEmpty) {
      return S.current.carPlateValidator;
    }
    return null;
  }
}
