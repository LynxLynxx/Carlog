import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/other_features/error/presentation/cubit/network_connection_cubit.dart';
import 'package:carlog/features/other_features/root/presentation/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:carlog/features/other_features/root/presentation/widgets/custom_floating_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                      backgroundColor: context.errorContainer,
                      child: const Icon(Icons.wifi_off),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   margin: PaddingsK.b25,
      //   child: CircularMenu(
      //     toggleButtonSize: 35,
      //     radius: 85,
      //     curve: Curves.fastOutSlowIn,
      //     reverseCurve: Curves.fastOutSlowIn,
      //     items: [
      //       CircularMenuItem(
      //           icon: Icons.home, color: Colors.green, onTap: () {}),
      //       CircularMenuItem(
      //           icon: Icons.search, color: Colors.blue, onTap: () {}),
      //       CircularMenuItem(
      //           icon: Icons.settings, color: Colors.orange, onTap: () {}),
      //       CircularMenuItem(
      //           icon: Icons.chat, color: Colors.purple, onTap: () {}),
      //       // CircularMenuItem(
      //       //     icon: Icons.notifications, color: Colors.brown, onTap: () {})
      //     ],
      //   ),
      // ),

      floatingActionButton: const CustomFloatingButtonWidget(),
      bottomNavigationBar:
          CustomBottomNavigationBarWidget(navigationShell: navigationShell),
    );
  }
}
