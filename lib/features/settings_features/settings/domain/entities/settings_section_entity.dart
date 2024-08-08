import 'package:carlog/features/settings_features/settings/domain/entities/settings_item_entity.dart';

final class SettingsSectionEntity {
  final String name;
  final List<SettingsItemEntity> items;

  const SettingsSectionEntity({required this.name, required this.items});
}
