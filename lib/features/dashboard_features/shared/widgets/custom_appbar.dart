import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        Expanded(
          child: Text(
            title,
            style: context.titleLarge!.copyWith(
              color: context.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
