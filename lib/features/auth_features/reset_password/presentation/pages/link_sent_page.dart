import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/bloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LinkSentPage extends StatelessWidget {
  const LinkSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ResetPasswordBloc(
        locator(),
      ),
      child: const LinkSentView(),
    );
  }
}

class LinkSentView extends StatelessWidget {
  const LinkSentView({super.key});

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: LottieBuilder.asset(AnimationsK.mail),
                ),
                SizedBox(
                  width: 50,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const AutoSizeText(
              "Sprawdź swojego maila",
              style: text22W700LS3,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
