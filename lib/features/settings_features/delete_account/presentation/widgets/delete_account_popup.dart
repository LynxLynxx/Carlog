import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/settings_features/delete_account/presentation/cubit/delete_account_cubit.dart';
import 'package:carlog/features/settings_features/delete_account/presentation/widgets/delete_account_button_widget.dart';
import 'package:carlog/features/settings_features/delete_account/presentation/widgets/text_password_form.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> deleteAccountModalBottomSheet(BuildContext context) {
  final TextEditingController currentPasswordController =
      TextEditingController();

  final FocusNode currentPasswordScope = FocusNode();

  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    showDragHandle: true,
    builder: (context) => BlocProvider(
      create: (context) => DeleteAccountCubit(locator(), locator()),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              AnimationsK.warning,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
            Text(
              S.of(context).areYouSure,
              style:
                  context.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            TextPasswordForm(
                currentPasswordController: currentPasswordController,
                currentPasswordScope: currentPasswordScope),
            const SizedBox(
              height: 20,
            ),
            DeleteAccountButtonWidget(
              currentPasswordController: currentPasswordController,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ),
  );
}
