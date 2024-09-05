import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/gorouter_extension.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CustomBottomNavigationBarWidget(
      {super.key, required this.navigationShell});

  void onTap(index) {
    navigationShell.goBranchAndTrack(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PaddingsK.l30r30top10b30,
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: PaddingsK.circular20,
        color: context.secondaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigationBarElement(
            index: 0,
            func: onTap,
            isSelected: navigationShell.currentIndex == 0,
          ),
          BottomNavigationBarElement(
            index: 1,
            func: onTap,
            isSelected: navigationShell.currentIndex == 1,
          ),
          BottomNavigationBarElement(
            index: 2,
            func: onTap,
            isSelected: navigationShell.currentIndex == 2,
          ),
          BottomNavigationBarElement(
            index: 3,
            func: onTap,
            isSelected: navigationShell.currentIndex == 3,
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarElement extends StatelessWidget {
  final int index;
  final Function(int index) func;
  final bool isSelected;
  const BottomNavigationBarElement(
      {super.key,
      required this.index,
      required this.func,
      required this.isSelected});

  getIcon() {
    switch (index) {
      case 0:
        return isSelected ? ImagesK.homeFill : ImagesK.home;
      case 1:
        return isSelected ? ImagesK.carFill : ImagesK.car;
      case 2:
        return isSelected ? ImagesK.chartFill : ImagesK.chart;
      case 3:
        return isSelected ? ImagesK.profileFill : ImagesK.profile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => func(index),
      child: SvgPicture.asset(
        getIcon(),
        colorFilter: ColorFilter.mode(context.onSurface, BlendMode.srcIn),
        width: 25,
        height: 25,
      ),
    );
  }
}
