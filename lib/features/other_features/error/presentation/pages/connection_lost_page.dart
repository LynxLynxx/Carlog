import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ConnectionLostPage extends StatelessWidget {
  const ConnectionLostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConnectionLostView();
  }
}

class ConnectionLostView extends StatelessWidget {
  const ConnectionLostView({super.key});

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
                  child: LottieBuilder.asset(AnimationsK.connectionLost),
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
              "Utracono połączenie z siecią.",
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
