import 'package:carlog/features/settings_features/settings/domain/entities/settings_items.dart';
import 'package:carlog/features/settings_features/settings/presentation/widgets/settings_section_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarlogScaffold.title(
      title: S.current.settings,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: settingsItems(context).length,
          itemBuilder: (context, index) => SettingsSectionWidget(
            sectionEntity: settingsItems(context)[index],
          ),
        ),
      ),
    );
  }
}
