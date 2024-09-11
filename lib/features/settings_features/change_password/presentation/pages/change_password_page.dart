import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/settings_features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:carlog/features/settings_features/change_password/presentation/widgets/change_password_form.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_bottom_button_widget.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:carlog/shared/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ChangePasswordCubit(locator(), locator()),
      child: const _ChangePasswordView(),
    );
  }
}

class _ChangePasswordView extends StatefulWidget {
  const _ChangePasswordView({
    super.key,
  });

  @override
  State<_ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<_ChangePasswordView> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reNewPasswordController = TextEditingController();
  final FocusNode currentPasswordScope = FocusNode();
  final FocusNode newPasswordScope = FocusNode();
  final FocusNode reNewPasswordScope = FocusNode();

  final changePasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CarlogScaffold.title(
        title: S.of(context).changePassword,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              state.maybeWhen(orElse: () {
                return null;
              }, failure: (failure) {
                SnackbarsK.errorSnackbar(failure.message ?? "").show(context);
                return null;
              }, data: () {
                currentPasswordController.clear();
                newPasswordController.clear();
                reNewPasswordController.clear();
                return null;
              });
            },
            builder: (context, state) {
              return state.when(
                loading: () => ChangePasswordForm(
                    currentPasswordController: currentPasswordController,
                    newPasswordController: newPasswordController,
                    reNewPasswordController: reNewPasswordController,
                    changePasswordFormKey: changePasswordFormKey),
                initial: () => ChangePasswordForm(
                  currentPasswordController: currentPasswordController,
                  newPasswordController: newPasswordController,
                  reNewPasswordController: reNewPasswordController,
                  changePasswordFormKey: changePasswordFormKey,
                  onEditingComplete: (_) => _onSave(),
                ),
                data: () => ChangePasswordForm(
                  currentPasswordController: currentPasswordController,
                  newPasswordController: newPasswordController,
                  reNewPasswordController: reNewPasswordController,
                  changePasswordFormKey: changePasswordFormKey,
                  onEditingComplete: (_) => _onSave(),
                ),
                failure: (failure) => ErrorIndicator(failure: failure),
              );
            },
          ),
        ),
        bottomWidget:
            BlocSelector<ChangePasswordCubit, ChangePasswordState, bool>(
          selector: (state) {
            return state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );
          },
          builder: (context, state) {
            return ValueListenableBuilder(
              valueListenable: currentPasswordController,
              builder: (context, value, child) => ValueListenableBuilder(
                valueListenable: newPasswordController,
                builder: (context, value, child) => ValueListenableBuilder(
                    valueListenable: reNewPasswordController,
                    builder: (context, value, child) {
                      return CarlogBottomButtonWidget(
                        title: S.of(context).save,
                        isLoading: state,
                        isActive: context.watch<ChangePasswordCubit>().isActive(
                            newPasswordController.text,
                            reNewPasswordController.text),
                        onTap: () => _onSave(),
                      );
                    }),
              ),
            );
          },
        ),
      ),
    );
  }

  _onSave() {
    bool valid = changePasswordFormKey.currentState!.validate();
    if (!valid) {
      return;
    }
    context.read<ChangePasswordCubit>().changePassword(
        currentPasswordController.text,
        newPasswordController.text,
        reNewPasswordController.text);
  }
}
