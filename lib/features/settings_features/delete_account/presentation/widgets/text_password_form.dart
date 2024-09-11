import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/settings_features/delete_account/presentation/cubit/delete_account_cubit.dart';
import 'package:carlog/features/settings_features/my_account/presentation/widgets/carlog_settings_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextPasswordForm extends StatelessWidget {
  final TextEditingController currentPasswordController;
  final FocusNode currentPasswordScope;
  const TextPasswordForm(
      {super.key,
      required this.currentPasswordController,
      required this.currentPasswordScope});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingsK.h30,
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () {
            return null;
          },
          failure: (failure) {
            SnackbarsK.errorSnackbar(failure.message ?? "").show(context);
            return null;
          },
        ),
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: DurationsK.d350,
            child: state.when(
              initial: () => Text(
                FirebaseAuth.instance.currentUser?.providerData[0].providerId ==
                        "password"
                    ? S.of(context).doYouReallyWantToDeleteYourAccount
                    : S.of(context).thisAccountWasCreated,
                style: context.titleSmall!.copyWith(color: context.outline),
                textAlign: TextAlign.center,
              ),
              loading: () => CarlogSettingTextField(
                labelText: S.of(context).currentPassword,
                focusNode: currentPasswordScope,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.continueAction,
                textCapitalization: TextCapitalization.words,
                onEditingComplete: (_) {
                  FocusScope.of(context).nextFocus();
                },
                textController: currentPasswordController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return S.of(context).notValidEmpty;
                  }
                  return null;
                },
              ),
              data: () => CarlogSettingTextField(
                labelText: S.of(context).currentPassword,
                focusNode: currentPasswordScope,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.continueAction,
                textCapitalization: TextCapitalization.words,
                onEditingComplete: (_) {
                  context
                      .read<DeleteAccountCubit>()
                      .deleteAccount(currentPasswordController.text);
                },
                textController: currentPasswordController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return S.of(context).notValidEmpty;
                  }
                  return null;
                },
              ),
              failure: (failure) => CarlogSettingTextField(
                labelText: S.of(context).currentPassword,
                focusNode: currentPasswordScope,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.continueAction,
                textCapitalization: TextCapitalization.words,
                onEditingComplete: (_) {
                  context
                      .read<DeleteAccountCubit>()
                      .deleteAccount(currentPasswordController.text);
                },
                textController: currentPasswordController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return S.of(context).notValidEmpty;
                  }
                  return null;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
