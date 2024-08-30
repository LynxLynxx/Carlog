import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/settings_features/about_app/presentation/widgets/contributor_connect_button.dart';
import 'package:flutter/material.dart';

class ContributorCardWidget extends StatelessWidget {
  final String contributorName;
  final String? contributorJobTitle;
  final List<ContributorConnectButton>? connectButtons;
  const ContributorCardWidget({
    super.key,
    required this.contributorName,
    this.contributorJobTitle,
    this.connectButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: context.inversePrimary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  contributorName,
                  style: context.titleMedium,
                ),
              ),
              Center(
                child: Text(
                  contributorJobTitle ?? "",
                  style: context.bodySmall,
                ),
              ),
              const SizedBox(height: 10),
              if (connectButtons != null)
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 4,
                    children: [
                      ...connectButtons!,
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
