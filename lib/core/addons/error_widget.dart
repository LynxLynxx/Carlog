import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

class ErrorBannerWidget extends StatelessWidget {
  final String displayError;
  const ErrorBannerWidget({super.key, required this.displayError});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: DurationsK.d250,
        child: displayError.isNotEmpty
            ? ErrorChildWidget(
                displayError: displayError,
              )
            : const SizedBox.shrink(),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            ),
          );
        });
  }
}

class ErrorChildWidget extends StatelessWidget {
  final String displayError;
  const ErrorChildWidget({super.key, required this.displayError});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingsK.all4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: PaddingsK.circular10,
        color: context.errorContainer,
      ),
      width: double.infinity,
      height: 40,
      child: Text(
        displayError,
        style: context.labelSmall!.copyWith(
            color: context.onErrorContainer, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
