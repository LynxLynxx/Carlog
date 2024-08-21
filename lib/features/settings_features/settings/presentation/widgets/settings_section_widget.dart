import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/settings_features/settings/domain/entities/settings_section_entity.dart';
import 'package:carlog/features/settings_features/settings/presentation/widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';

class SettingsSectionWidget extends StatelessWidget {
  final SettingsSectionEntity sectionEntity;
  const SettingsSectionWidget({
    super.key,
    required this.sectionEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 3),
            child: Text(
              sectionEntity.name.toUpperCase(),
              style: context.labelSmall,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: sectionEntity.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SettingsItemWidget(
                        settingsItem: sectionEntity.items[index]),
                    (index + 1) != sectionEntity.items.length
                        ? const Divider(height: 1)
                        : const SizedBox.shrink(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
