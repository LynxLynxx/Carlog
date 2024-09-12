import 'package:carlog/features/settings_features/my_account/presentation/widgets/carlog_settings_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm(
      {super.key,
      this.onEditingComplete,
      required this.senderController,
      required this.emailController,
      required this.subjectController,
      required this.messageController,
      required this.contactGlobalKey,
      this.senderNode,
      this.emailNode,
      this.subjectNode,
      this.messageNode});

  final TextEditingController senderController;
  final TextEditingController emailController;
  final TextEditingController subjectController;
  final TextEditingController messageController;

  final FocusNode? senderNode;
  final FocusNode? emailNode;
  final FocusNode? subjectNode;
  final FocusNode? messageNode;

  final GlobalKey contactGlobalKey;
  final Function(String?)? onEditingComplete;

  @override
  State<ContactForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.contactGlobalKey,
      child: Column(
        children: [
          CarlogSettingTextField(
            labelText: S.of(context).sender,
            focusNode: widget.senderNode,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.continueAction,
            textCapitalization: TextCapitalization.words,
            onEditingComplete: (_) {
              FocusScope.of(context).nextFocus();
            },
            textController: widget.senderController,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
          CarlogSettingTextField(
            labelText: S.of(context).email,
            focusNode: widget.emailNode,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            onEditingComplete: (_) {
              FocusScope.of(context).nextFocus();
            },
            textController: widget.emailController,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
          CarlogSettingTextField(
            labelText: S.of(context).subject,
            focusNode: widget.subjectNode,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            onEditingComplete: (_) {
              FocusScope.of(context).nextFocus();
            },
            textController: widget.subjectController,
            validator: (value) {
              if (value == "" || value == null) {
                return S.of(context).notValidEmpty;
              }
              return null;
            },
          ),
          CarlogSettingTextField(
            labelText: S.of(context).message,
            focusNode: widget.messageNode,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            textController: widget.messageController,
            onEditingComplete: widget.onEditingComplete,
            maxLines: 5,
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
