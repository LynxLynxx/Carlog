import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/bloc/reset_password_bloc.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/widgets/reset_password_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            color: context.surfaceColor, borderRadius: PaddingsK.circular10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 50,
                ),
                const AutoSizeText(
                  "Zresetuj hasło",
                  style: text22W700LS3,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 50,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(
                      Icons.close,
                      color: context.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const ResetPasswordFormWidget(),
          ],
        ),
      ),
    );
  }
}
