import 'package:carlog/core/constants/settings_items.dart';
import 'package:carlog/features/dashboard_features/settings/presentation/widgets/settings_section_widget.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardAppbar.title(
      title: "Settings",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: settingsItems.length,
          itemBuilder: (context, index) => SettingsSectionWidget(
            sectionEntity: settingsItems[index],
          ),
        ),
      ),
    );
  }
}
