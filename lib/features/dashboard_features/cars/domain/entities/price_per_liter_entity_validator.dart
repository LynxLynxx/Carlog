import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class PricePerLiterEntityValidator extends FormzInput<String, String> {
  const PricePerLiterEntityValidator.pure([super.value = '']) : super.pure();
  const PricePerLiterEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.isEmpty || value.length > 8) && value.isNotEmpty) {
      return S.current.pricePerLiterValidator;
    }
    return null;
  }
}
