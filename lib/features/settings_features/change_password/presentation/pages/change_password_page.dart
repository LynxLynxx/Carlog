import 'package:carlog/features/settings_features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:carlog/features/settings_features/my_account/presentation/widgets/carlog_settings_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_bottom_button_widget.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ChangePasswordCubit(),
      child: const _ChangePasswordView(),
    );
  }
}

class _ChangePasswordView extends StatelessWidget {
  const _ChangePasswordView();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CarlogScaffold.title(
        showAdmobBanner: true,
        title: S.of(context).changePassword,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                CarlogSettingTextField(
                    labelText: S.of(context).currentPassword),
                CarlogSettingTextField(labelText: S.of(context).newPassword),
                CarlogSettingTextField(labelText: S.of(context).repeatPassword),
              ],
            ),
          ),
        ),
        bottomWidget: CarlogBottomButtonWidget(
          title: S.of(context).save,
          onTap: () {},
        ),
      ),
    );
  }
}
