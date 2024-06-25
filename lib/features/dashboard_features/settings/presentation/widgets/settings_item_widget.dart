import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/settings/domain/entities/settings_item_action_enu.dart';
import 'package:carlog/features/dashboard_features/settings/domain/entities/settings_item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsItemWidget extends StatefulWidget {
  final SettingsItemEntity settingsItem;
  const SettingsItemWidget({super.key, required this.settingsItem});

  @override
  State<SettingsItemWidget> createState() => _SettingsItemWidgetState();
}

class _SettingsItemWidgetState extends State<SettingsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
          minVerticalPadding: 1,
          enableFeedback: true,
          leading: Icon(
            widget.settingsItem.icon,
            color: widget.settingsItem.iconColor,
          ),
          title: Text(
            widget.settingsItem.name,
            style: context.titleMedium,
          ),
          trailing: _buildTrailing(widget.settingsItem),
          onTap: _onTapFunction(widget.settingsItem)),
    );
  }

  Function()? _onTapFunction(SettingsItemEntity item) {
    switch (item.action) {
      case SettingsItemAction.none:
        return () {};
      default:
        return null;
    }
  }

  Widget _buildTrailing(SettingsItemEntity item) {
    switch (item.action) {
      case SettingsItemAction.switchButton:
        return CupertinoSwitch(
            value: item.switchValue,
            onChanged: (value) {
              setState(() {
                item.switchValue = value;
              });
            });

      case SettingsItemAction.selectionButton:
        return TextButton.icon(
          onPressed: () {
            print("BUTTON");
          },
          label: Text(item.selectionName),
          icon: const Icon(Icons.keyboard_arrow_right_outlined),
          iconAlignment: IconAlignment.end,
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
