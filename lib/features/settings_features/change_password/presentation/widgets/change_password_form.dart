import 'package:carlog/features/settings_features/my_account/presentation/widgets/carlog_settings_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    super.key,
    this.onEditingComplete,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.reNewPasswordController,
    required this.changePasswordFormKey,
    this.currentPasswordScope,
    this.newPasswordScope,
    this.reNewPasswordScope,
  });

  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController reNewPasswordController;
  final FocusNode? currentPasswordScope;
  final FocusNode? newPasswordScope;
  final FocusNode? reNewPasswordScope;

  final GlobalKey changePasswordFormKey;
  final Function(String?)? onEditingComplete;

  @override
  State<ChangePasswordForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<ChangePasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.changePasswordFormKey,
      child: Column(
        children: [
          CarlogSettingTextField(
            labelText: S.of(context).currentPassword,
            focusNode: widget.currentPasswordScope,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.continueAction,
            textCapitalization: TextCapitalization.words,
            onEditingComplete: (_) {
              FocusScope.of(context).nextFocus();
            },
            textController: widget.currentPasswordController,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
          CarlogSettingTextField(
            labelText: S.of(context).newPassword,
            focusNode: widget.newPasswordScope,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            onEditingComplete: (_) {
              FocusScope.of(context).nextFocus();
            },
            textController: widget.newPasswordController,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
          CarlogSettingTextField(
            labelText: S.of(context).repeatPassword,
            focusNode: widget.reNewPasswordScope,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            textController: widget.reNewPasswordController,
            onEditingComplete: widget.onEditingComplete,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
