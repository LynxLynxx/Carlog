import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/settings_features/my_account/presentation/widgets/carlog_settings_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class WebContactViewSmall extends StatelessWidget {
  const WebContactViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Text(
                "Contact Us",
                style: context.titleLarge,
              ),
              Text(
                "Feel free to reach out to us at any time, and we’ll get back to you as quickly as possible. Your questions and feedback are important to us!",
                style: context.titleSmall,
              ),
              CarlogSettingTextField(
                labelText: S.of(context).currentPassword,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.continueAction,
                textCapitalization: TextCapitalization.words,
                // textController: widget.currentPasswordController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return S.of(context).notValidEmpty;
                  }
                  return null;
                },
              ),
              CarlogSettingTextField(
                labelText: S.of(context).currentPassword,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.continueAction,
                textCapitalization: TextCapitalization.words,
                // textController: widget.currentPasswordController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return S.of(context).notValidEmpty;
                  }
                  return null;
                },
              ),
              CarlogSettingTextField(
                labelText: S.of(context).currentPassword,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.continueAction,
                textCapitalization: TextCapitalization.words,
                // textController: widget.currentPasswordController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return S.of(context).notValidEmpty;
                  }
                  return null;
                },
              ),
            ],
          )),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
