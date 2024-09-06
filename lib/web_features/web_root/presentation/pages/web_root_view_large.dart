import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/other_features/theme_mode/presentation/cubit/theme_mode_cubit.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WebRootViewLarge extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const WebRootViewLarge({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return CarlogScaffold.appbar(
      appBar: SliverAppBar(
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _AppBarElementWidget(
                id: 0, isSelected: navigationShell.currentIndex == 0),
            _AppBarElementWidget(
                id: 1, isSelected: navigationShell.currentIndex == 1),
            _AppBarElementWidget(
                id: 2, isSelected: navigationShell.currentIndex == 2),
            const _ThemeSwitcherWidget(),
          ],
        ),
      ),
      body: navigationShell,
    );
  }
}

class _AppBarElementWidget extends StatelessWidget {
  final int id;
  final bool isSelected;
  const _AppBarElementWidget({required this.id, required this.isSelected});

  String get getTitle {
    switch (id) {
      case 0:
        return "HOME";
      case 1:
        return "REQUEST FEATURE";
      case 2:
        return "CONTACT";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingsK.h20,
      child: Text(
        getTitle,
        style: context.displayLarge!.copyWith(
            fontSize: 30,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            color:
                isSelected ? context.primaryColor : context.onPrimaryContainer),
      ),
    );
  }
}

class _ThemeSwitcherWidget extends StatelessWidget {
  const _ThemeSwitcherWidget();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ThemeMode mode = !context.isDark ? ThemeMode.dark : ThemeMode.light;
          context.read<ThemeModeCubit>().changeTheme(mode);
        },
        icon: Icon(
            context.isDark ? Icons.nightlight : Icons.nightlight_outlined));
  }
}
