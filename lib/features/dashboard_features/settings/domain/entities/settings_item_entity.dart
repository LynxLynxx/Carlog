import 'package:carlog/features/dashboard_features/settings/domain/entities/settings_item_action_enu.dart';
import 'package:flutter/material.dart';

final class SettingsItemEntity {
  final String name;
  final SettingsItemAction action;
  final IconData icon;
  final Color iconColor;
  String selectionName;
  bool switchValue;

  SettingsItemEntity({
    required this.name,
    this.action = SettingsItemAction.none,
    required this.icon,
    required this.iconColor,
    this.selectionName = "",
    this.switchValue = false,
  });

  SettingsItemEntity.switchButton({
    required this.name,
    this.action = SettingsItemAction.switchButton,
    required this.icon,
    required this.iconColor,
    this.selectionName = "",
    this.switchValue = false,
  });

  SettingsItemEntity.selectionButton({
    required this.name,
    this.action = SettingsItemAction.selectionButton,
    required this.icon,
    required this.iconColor,
    this.selectionName = "",
    this.switchValue = false,
  });
}
