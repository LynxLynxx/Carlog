import 'package:flutter/material.dart';

class ChangeAuthScreen extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const ChangeAuthScreen({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          OutlinedButton(
            onPressed: onPressed,
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
