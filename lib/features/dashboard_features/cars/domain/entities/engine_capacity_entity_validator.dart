import 'package:formz/formz.dart';

class EngineCapacityEntityValidator extends FormzInput<String, String> {
  const EngineCapacityEntityValidator.pure([super.value = '']) : super.pure();
  const EngineCapacityEntityValidator.dirty({String value = ''})
      : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.isEmpty || value.length > 7) && value.isNotEmpty) {
      return 'Engine capacity should be between 1 and 7 digits';
    }
    return null;
  }
}
