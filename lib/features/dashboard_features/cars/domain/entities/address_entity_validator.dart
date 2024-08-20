import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class AddressEntityValidator extends FormzInput<String, String> {
  const AddressEntityValidator.pure([super.value = '']) : super.pure();
  const AddressEntityValidator.dirty({String value = ''})
      : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return S.current.coordinatesValidator;
    }
    if (value.length > 30) {
      return S.current.coordinatesValidator;
    }
    return null;
  }
}
