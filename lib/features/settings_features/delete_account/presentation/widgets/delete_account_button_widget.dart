import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/settings_features/delete_account/presentation/cubit/delete_account_cubit.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountButtonWidget extends StatelessWidget {
  final TextEditingController currentPasswordController;
  const DeleteAccountButtonWidget(
      {super.key, required this.currentPasswordController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: DurationsK.d350,
          child: state.when(
            loading: () => _customButton(null, null, context),
            data: () => _customButton(
                () => context
                    .read<DeleteAccountCubit>()
                    .deleteAccount(currentPasswordController.text),
                S.of(context).confirm,
                context),
            failure: (failure) => _customButton(
                () => context
                    .read<DeleteAccountCubit>()
                    .deleteAccount(currentPasswordController.text),
                S.of(context).confirm,
                context),
            initial: () => _customButton(
                () => context.read<DeleteAccountCubit>().enterPassword(),
                S.of(context).deleteAcount,
                context),
          ),
        );
      },
    );
  }

  Widget _customButton(
          VoidCallback? onTap, String? title, BuildContext context) =>
      FilledButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.errorColor,
        ),
        onPressed: onTap,
        child: title == null
            ? Transform.scale(
                scale: 0.7,
                child: const CircularProgressIndicator(
                  strokeWidth: 6,
                ),
              )
            : Text(title),
      );
}
