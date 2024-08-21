import 'package:carlog/core/error/failures.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final Failure failure;
  final String errorPrefixText;
  final VoidCallback? onTryAgain;
  const ErrorIndicator({
    super.key,
    required this.failure,
    this.errorPrefixText = "",
    this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(failure.message.toString()),
        ],
      ),
    );
  }
}
