import 'package:carlog/features/settings_features/my_account/presentation/widgets/carlog_settings_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.userDataFormKey,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final GlobalKey userDataFormKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: userDataFormKey,
      child: Column(
        children: [
          CarlogSettingTextField(
            labelText: S.of(context).name,
            textController: firstNameController,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
          CarlogSettingTextField(
            labelText: S.of(context).lastName,
            textController: lastNameController,
          ),
          CarlogSettingTextField(
            labelText: S.of(context).email,
            readOnly: true,
            textController: emailController,
          ),
        ],
      ),
    );
  }
}
