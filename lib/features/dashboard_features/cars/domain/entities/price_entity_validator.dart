import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class PriceEntityValidator extends FormzInput<String, String> {
  const PriceEntityValidator.pure([super.value = '']) : super.pure();
  const PriceEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.isEmpty || value.length > 5) && value.isNotEmpty) {
      return S.current.priceValidator;
    }
    return null;
  }
}
