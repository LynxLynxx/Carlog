import 'package:flutter/material.dart';

class CarlogBottomButtonWidget extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLoading;
  final VoidCallback onTap;
  const CarlogBottomButtonWidget({
    super.key,
    required this.title,
    this.isActive = false,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceBright,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 25),
          child: FilledButton(
            onPressed: isActive ? onTap : null,
            child: isLoading
                ? Transform.scale(
                    scale: 0.7,
                    child: const CircularProgressIndicator(
                      strokeWidth: 6,
                    ),
                  )
                : Text(title),
          ),
        ),
      ),
    );
  }
}
