import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class PasswordMailEntity extends FormzInput<String, String> {
  const PasswordMailEntity.pure([super.value = '']) : super.pure();
  const PasswordMailEntity.dirty([super.value = '']) : super.dirty();

  @override
  validator(String value) {
    final passwordRegExp = RegExp(
        r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+-=\|/?.,><;:\[\]{}])[A-Za-z0-9!@#$%^&*()_+-=\|/?.,><;:\[\]{}]{8,}$");
    // final passwordRegExp = RegExp(r"^[0-9a-zA-Z@$!%*?&]{6,}$");
    if (!passwordRegExp.hasMatch(value) && value.isNotEmpty) {
      return S.current.passwordValidator;
    } else if (value.isEmpty) {
      return S.current.notValidEmpty;
    }

    return null;
  }
}
