import 'package:carlog/core/constants/settings_icons_colors.dart';
import 'package:carlog/core/extensions/string_extension.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/other_features/theme_mode/presentation/cubit/theme_mode_cubit.dart';
import 'package:carlog/features/settings_features/settings/domain/entities/settings_item_entity.dart';
import 'package:carlog/features/settings_features/settings/domain/entities/settings_section_entity.dart';
import 'package:carlog/features/settings_features/settings/domain/entities/supported_languages_entity.dart';
import 'package:carlog/features/settings_features/settings/presentation/widgets/language_selection_dialog.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

List<SettingsSectionEntity> settingsItems(BuildContext context) => [
      //SECTION - ACCOUNT
      SettingsSectionEntity(
        name: S.of(context).account,
        items: [
          SettingsItemEntity(
            name: S.of(context).myAccount,
            icon: "assets/icons/settings/user.svg",
            iconColor: settingsIconColors[0],
            onTap: () => context.push(RoutesK.myAccount.fullPath),
          ),
          if (FirebaseAuth.instance.currentUser?.providerData[0].providerId ==
              "password")
            SettingsItemEntity(
              name: S.of(context).changePassword,
              icon: "assets/icons/settings/password.svg",
              iconColor: settingsIconColors[1],
              onTap: () => context.push(RoutesK.changePassword.fullPath),
            ),
          SettingsItemEntity(
            name: S.of(context).logOut,
            icon: "assets/icons/settings/log_out.svg",
            iconColor: settingsIconColors[2],
            onTap: () => context
                .read<AuthBloc>()
                .add(const AuthEvent.appLogoutRequested()),
          ),
        ],
      ),
      //!SECTION
      //SECTION - CUSTOMIZE
      SettingsSectionEntity(
        name: S.of(context).customize,
        items: [
          SettingsItemEntity.selectionButton(
            name: S.of(context).language,
            icon: "assets/icons/settings/language.svg",
            iconColor: settingsIconColors[3],
            selectionName: S.current
                .supportedLanguage(Intl.getCurrentLocale())
                .capitalize(),
            onTap: () async {
              languageSelectionDialog(
                  context,
                  supportedLanguages(context, S.delegate.supportedLocales),
                  Intl.getCurrentLocale());
            },
          ),
          SettingsItemEntity.selectionButton(
            name: S.of(context).colorTheme,
            icon: "assets/icons/settings/theme.svg",
            iconColor: settingsIconColors[4],
            selectionName: S
                .of(context)
                .supportedThemes(
                    context.watch<ThemeModeCubit>().state.themeMode.name)
                .capitalize(),
            onTap: () {
              ThemeMode mode = context.read<ThemeModeCubit>().state.themeMode ==
                      ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
              context.read<ThemeModeCubit>().changeTheme(mode);
            },
          ),
          // SettingsItemEntity.selectionButton(
          //   name: S.of(context).regionCountry,
          //   icon: "assets/icons/settings/region.svg",
          //   iconColor: settingsIconColors[2],
          // ),
        ],
      ),
      //!SECTION
      // //SECTION - PERMISSIONS
      // SettingsSectionEntity(name: S.of(context).permissions, items: [
      //   SettingsItemEntity.switchButton(
      //     name: S.of(context).notifications,
      //     icon: "assets/icons/settings/notifications.svg",
      //     iconColor: settingsIconColors[4],
      //   ),
      //   SettingsItemEntity.switchButton(
      //     name: S.of(context).library,
      //     icon: "assets/icons/settings/library.svg",
      //     iconColor: settingsIconColors[3],
      //   ),
      // ]),
      // //!SECTION
      // //SECTION - FEEDBACK
      // SettingsSectionEntity(
      //   name: S.of(context).feedback,
      //   items: [
      //     SettingsItemEntity(
      //       name: S.of(context).requestNewFeature,
      //       icon: "assets/icons/settings/request_new_feature.svg",
      //       iconColor: settingsIconColors[6],
      //     ),
      //     SettingsItemEntity(
      //       name: S.of(context).reportProblem,
      //       icon: "assets/icons/settings/report_problem.svg",
      //       iconColor: settingsIconColors[5],
      //     ),
      //   ],
      // ),
      // //!SECTION
      // //SECTION - LEGAL INFORMATION
      // SettingsSectionEntity(
      //   name: S.of(context).legalInformation,
      //   items: [
      //     SettingsItemEntity(
      //       name: S.of(context).privacyPolicy,
      //       icon: "assets/icons/settings/privacy_policy.svg",
      //       iconColor: settingsIconColors[6],
      //     ),
      //     SettingsItemEntity(
      //       name: S.of(context).termsOfUse,
      //       icon: "assets/icons/settings/terms_of_use.svg",
      //       iconColor: settingsIconColors[5],
      //     ),
      //   ],
      // ),
      // //!SECTION

      //SECTION - ABOUT APP
      SettingsSectionEntity(
        name: "About the app",
        items: [
          SettingsItemEntity(
            name: "About",
            icon: "assets/icons/settings/terms_of_use.svg",
            iconColor: settingsIconColors[5],
            onTap: () => context.push(RoutesK.aboutApp.fullPath),
          ),
          SettingsItemEntity(
            name: S.of(context).requestNewFeature,
            icon: "assets/icons/settings/request_new_feature.svg",
            iconColor: settingsIconColors[6],
            onTap: () => context.push(RoutesK.webview,
                extra:
                    "https://webview.canny.io?boardToken=3e9fed8b-329d-efba-abaa-aa96a1934580&ssoToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RlbkBnbWFpbC5jb20iLCJpZCI6Ik1Sbzdnck1aakJTSFNtcDNIb0hXZ1ZZYkp1TjIiLCJuYW1lIjoidGVzdGVuQGdtYWlsLmNvbSIsImlhdCI6MTcyNDg1NjUyNSwiZXhwIjoxNzI0ODYwMTI1fQ.G-U5dyO5RujVHoc3z5UjSZaqNnh-YmfA1Dz44yCDVk8"),
          ),
        ],
      ),
      //!SECTION
    ];
