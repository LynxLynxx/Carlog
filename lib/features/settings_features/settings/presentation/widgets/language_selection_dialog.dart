import 'package:carlog/core/extensions/string_extension.dart';
import 'package:carlog/features/settings_features/settings/domain/entities/supported_languages_entity.dart';
import 'package:carlog/features/settings_features/settings/presentation/cubit/language_cubit/language_cubit.dart';
import 'package:carlog/shared/widgets/show_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<T?> languageSelectionDialog<T>(
  BuildContext appContext,
  List<SupportedLanguageEntity> items,
  String selectedItem,
) async =>
    await dialogBuilder<T>(
      appContext,
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(appContext).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        items[index].languageTranslation.capitalize(),
                      ),
                      trailing: items[index].languageCode == selectedItem
                          ? const Icon(Icons.check)
                          : null,
                      onTap: () {
                        appContext
                            .read<LanguageCubit>()
                            .changeLanguage(items[index].languageCode);
                        appContext.pop();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
