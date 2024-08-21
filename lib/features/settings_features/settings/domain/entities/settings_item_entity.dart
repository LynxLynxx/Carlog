import 'package:carlog/features/settings_features/settings/domain/entities/settings_item_action_enum.dart';
import 'package:flutter/material.dart';

final class SettingsItemEntity {
  final String name;
  final SettingsItemAction action;
  final String icon;
  final Color iconColor;
  String selectionName;
  bool switchValue;
  final VoidCallback? onTap;

  SettingsItemEntity({
    required this.name,
    this.action = SettingsItemAction.none,
    required this.icon,
    required this.iconColor,
    this.selectionName = "",
    this.switchValue = false,
    this.onTap,
  });

  SettingsItemEntity.switchButton({
    required this.name,
    this.action = SettingsItemAction.switchButton,
    required this.icon,
    required this.iconColor,
    this.selectionName = "",
    this.switchValue = false,
    this.onTap,
  });

  SettingsItemEntity.selectionButton({
    required this.name,
    this.action = SettingsItemAction.selectionButton,
    required this.icon,
    required this.iconColor,
    this.selectionName = "",
    this.switchValue = false,
    this.onTap,
  });
}
