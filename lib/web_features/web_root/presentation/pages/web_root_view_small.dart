import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/other_features/theme_mode/presentation/cubit/theme_mode_cubit.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/events/presentation/cubit/events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WebRootViewSmall extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const WebRootViewSmall({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: navigationShell,
    );
  }

  void onTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    Scaffold.of(context).closeDrawer();
    context.read<EventsCubit>().logEvent(FirebaseEventType.values[index]);
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: context.primaryColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      );

  Widget _buildDrawer(BuildContext context) => Drawer(
        backgroundColor: context.surfaceColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _AppBarElementWidget(
              id: 0,
              func: onTap,
              isSelected: navigationShell.currentIndex == 0,
            ),
            _AppBarElementWidget(
              id: 1,
              func: onTap,
              isSelected: navigationShell.currentIndex == 1,
            ),
            _AppBarElementWidget(
              id: 2,
              func: onTap,
              isSelected: navigationShell.currentIndex == 2,
            ),
            const _ThemeSwitcherWidget(),
          ],
        ),
      );
}

class _AppBarElementWidget extends StatelessWidget {
  final int id;
  final bool isSelected;
  final Function(int index, BuildContext context) func;
  const _AppBarElementWidget(
      {required this.id, required this.isSelected, required this.func});

  String get getTitle {
    switch (id) {
      case 0:
        return S.current.contact;
      case 1:
        return S.current.home;
      case 2:
        return S.current.suggest;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => func(id, context),
      child: Container(
        alignment: Alignment.center,
        width: getTitle.length * 25,
        height: 50,
        margin: PaddingsK.h20,
        child: Text(
          getTitle,
          style: context.displayLarge!.copyWith(
              fontSize: 30,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w300,
              color: isSelected
                  ? context.primaryColor
                  : context.onPrimaryContainer),
        ),
      ),
    );
  }
}

class _ThemeSwitcherWidget extends StatelessWidget {
  const _ThemeSwitcherWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: IconButton(
          iconSize: 30,
          onPressed: () {
            ThemeMode mode = !context.isDark ? ThemeMode.dark : ThemeMode.light;
            context.read<ThemeModeCubit>().changeTheme(mode);
          },
          icon: Icon(
              context.isDark ? Icons.nightlight : Icons.nightlight_outlined)),
    );
  }
}
