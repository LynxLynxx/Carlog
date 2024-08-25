import 'package:carlog/features/settings_features/my_account/presentation/widgets/carlog_settings_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class UserDataForm extends StatefulWidget {
  const UserDataForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.userDataFormKey,
    this.firstNameScope,
    this.lastNameScope,
    this.onEditingComplete,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final GlobalKey userDataFormKey;
  final FocusNode? firstNameScope;
  final FocusNode? lastNameScope;
  final Function(String?)? onEditingComplete;

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.userDataFormKey,
      child: Column(
        children: [
          CarlogSettingTextField(
            labelText: S.of(context).name,
            focusNode: widget.firstNameScope,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.continueAction,
            textCapitalization: TextCapitalization.words,
            onEditingComplete: (_) {
              FocusScope.of(context).nextFocus();
            },
            textController: widget.firstNameController,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
          CarlogSettingTextField(
            labelText: S.of(context).lastName,
            focusNode: widget.lastNameScope,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            textController: widget.lastNameController,
            onEditingComplete: widget.onEditingComplete,
          ),
          CarlogSettingTextField(
            labelText: S.of(context).email,
            readOnly: true,
            textController: widget.emailController,
          ),
        ],
      ),
    );
  }
}
