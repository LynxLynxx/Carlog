import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/other_features/error/presentation/cubit/network_connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootPage({super.key, required this.navigationShell});

  void _onTap(index) {
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
          connectionStatus == ConnectionStatus.connected
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
        shape: const CircleBorder(),
        onPressed: () {},
        tooltip: 'Increment',
        elevation: 2.0,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              color: navigationShell.currentIndex == 0 ? Colors.amber : null,
              onPressed: () => context.go(RoutesK.home),
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.data_array)),
          ],
        ),
      ),
    );
  }
}
