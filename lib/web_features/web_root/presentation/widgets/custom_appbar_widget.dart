import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/other_features/theme_mode/presentation/cubit/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final PageController pageController;
  const CustomAppBar(
      {super.key, required this.navigationShell, required this.pageController});

  void onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _AppBarElementWidget(
            id: 0,
            isSelected: navigationShell.currentIndex == 0,
            func: onTap,
          ),
          _AppBarElementWidget(
              id: 1,
              isSelected: navigationShell.currentIndex == 1,
              func: onTap),
          _AppBarElementWidget(
              id: 2,
              isSelected: navigationShell.currentIndex == 2,
              func: onTap),
          const _ThemeSwitcherWidget(),
        ],
      ),
    );
  }
}

class _AppBarElementWidget extends StatelessWidget {
  final int id;
  final bool isSelected;
  final Function(int index) func;
  const _AppBarElementWidget(
      {required this.id, required this.isSelected, required this.func});

  String get getTitle {
    switch (id) {
      case 0:
        return "SUGGEST";
      case 1:
        return "HOME";
      case 2:
        return "CONTACT";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => func(id),
      child: Container(
        alignment: Alignment.center,
        width: getTitle.length * 25,
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
