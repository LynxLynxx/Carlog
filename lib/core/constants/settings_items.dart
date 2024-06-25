import 'package:carlog/core/constants/settings_icons_colors.dart';
import 'package:carlog/features/dashboard_features/settings/domain/entities/settings_item_entity.dart';
import 'package:carlog/features/dashboard_features/settings/domain/entities/settings_section_entity.dart';
import 'package:flutter/material.dart';

List<SettingsSectionEntity> settingsItems = [
  SettingsSectionEntity(
    name: "account",
    items: [
      SettingsItemEntity(
        name: "My Account",
        icon: Icons.person,
        iconColor: settingsIconColors[0],
      ),
      SettingsItemEntity(
        name: "Change Password",
        icon: Icons.password,
        iconColor: settingsIconColors[1],
      ),
    ],
  ),
  SettingsSectionEntity(name: "customize", items: [
    SettingsItemEntity.selectionButton(
      name: "Language",
      icon: Icons.language,
      iconColor: settingsIconColors[3],
    ),
    SettingsItemEntity.selectionButton(
      name: "Push Notifications",
      icon: Icons.notification_add,
      iconColor: settingsIconColors[4],
    ),
    SettingsItemEntity.selectionButton(
      name: "Region/Country",
      icon: Icons.notification_add,
      iconColor: settingsIconColors[2],
    ),
  ]),
  SettingsSectionEntity(name: "permissions", items: [
    SettingsItemEntity.switchButton(
      name: "Push Notifications",
      icon: Icons.language,
      iconColor: settingsIconColors[4],
    ),
    SettingsItemEntity.switchButton(
      name: "Library",
      icon: Icons.notification_add,
      iconColor: settingsIconColors[3],
    ),
  ]),
  SettingsSectionEntity(name: "feedback", items: [
    SettingsItemEntity(
      name: "Request New Feature",
      icon: Icons.language,
      iconColor: settingsIconColors[6],
    ),
    SettingsItemEntity(
      name: "Report Problem",
      icon: Icons.notification_add,
      iconColor: settingsIconColors[5],
    ),
  ]),
  SettingsSectionEntity(name: "legal information", items: [
    SettingsItemEntity(
      name: "Privacy Policy",
      icon: Icons.language,
      iconColor: settingsIconColors[6],
    ),
    SettingsItemEntity(
      name: "Terms of Use",
      icon: Icons.notification_add,
      iconColor: settingsIconColors[5],
    ),
  ]),
];
