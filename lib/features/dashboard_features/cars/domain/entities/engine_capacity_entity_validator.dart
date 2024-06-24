import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class EngineCapacityEntityValidator extends FormzInput<String, String> {
  const EngineCapacityEntityValidator.pure([super.value = '']) : super.pure();
  const EngineCapacityEntityValidator.dirty({String value = ''})
      : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.length > 7) {
      return S.current.engineCapacityValidator;
    }
    return null;
  }
}
