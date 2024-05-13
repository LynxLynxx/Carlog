import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/other_features/error/presentation/cubit/network_connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootPage({super.key, required this.navigationShell});

  void onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final connectionStatus =
        context.watch<NetworkConnectionCubit>().state.connectionStatus;
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          connectionStatus == ConnectionStatus.disconnected
              ? Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => context.push(RoutesK.connectionLostError),
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      child: const Icon(Icons.wifi_off),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: CircleBorder(
          side: BorderSide(
            width: 5,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        onPressed: () {},
        tooltip: 'Increment',
        elevation: 0.0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      bottomNavigationBar: Container(
        margin: PaddingsK.l30r30top10b30,
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: PaddingsK.circular20,
          color: Theme.of(context).colorScheme.secondaryContainer,
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
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
        width: 25,
        height: 25,
      ),
    );
  }
}
