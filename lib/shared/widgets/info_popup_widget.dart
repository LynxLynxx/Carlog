import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoPopupWidget extends StatelessWidget {
  final String title;
  final String body;
  const InfoPopupWidget({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: PaddingsK.h10,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: PaddingsK.h30v15,
        decoration: BoxDecoration(
            color: context.surfaceColor, borderRadius: PaddingsK.circular10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 40,
                ),
                Text(
                  title,
                  style: context.titleLarge,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const SizedBox(
                    width: 40,
                    child: Icon(Icons.close),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              body,
              style: context.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
