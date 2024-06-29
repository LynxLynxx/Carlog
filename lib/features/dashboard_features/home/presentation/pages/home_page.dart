import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/home_app_bar.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsBloc(locator())..add(const CarsEvent.getCars()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return DashboardAppbar.appbar(
      appBar: homeAppBar(
          context,
          isExpanded,
          () => setState(() {
                isExpanded = !isExpanded;
              })),
      body: AnimatedSize(
        duration: Durations.extralong1,
        child: Column(
          children: [
            TextButton(
              child: Column(
                children: [
                  const Text("ASD"),
                  Text(FirebaseAuth.instance.currentUser?.displayName ??
                      "NO NAME"),
                  Text(FirebaseAuth.instance.currentUser?.uid ?? "NO UID"),
                ],
              ),
              onPressed: () => context.push("/add"),
            ),
          ],
        ),
      ),
    );
  }
}
