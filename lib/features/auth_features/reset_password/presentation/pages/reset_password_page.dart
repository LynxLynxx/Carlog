import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/bloc/reset_password_bloc.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/widgets/reset_password_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(
        locator(),
      ),
      child: const ResetPasswordView(),
    );
  }
}

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: PaddingsK.h10,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: PaddingsK.all16,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: PaddingsK.circular10),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              "Zresetuj swoje hasło",
              style: text22W700LS3,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ResetPasswordFormWidget(),
          ],
        ),
      ),
    );
  }
}
