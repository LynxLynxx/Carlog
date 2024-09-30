import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

Future<void> allExpenseModal(BuildContext appContext) {
  return showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: appContext.surfaceColor,
    isScrollControlled: true,
    useSafeArea: true,
    context: appContext,
    builder: (context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 4),
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: context.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
