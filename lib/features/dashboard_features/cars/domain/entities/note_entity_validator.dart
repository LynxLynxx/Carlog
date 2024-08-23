import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class NoteEntityValidator extends FormzInput<String, String> {
  const NoteEntityValidator.pure([super.value = '']) : super.pure();
  const NoteEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return S.current.noteValidator;
    }
    if (value.length < 2 || value.length > 100) {
      return S.current.noteValidator;
    }
    return null;
  }
}
