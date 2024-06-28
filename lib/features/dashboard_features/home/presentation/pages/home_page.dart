import 'dart:developer';

import 'package:carlog/features/dashboard_features/home/presentation/widgets/home_app_bar.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return DashboardAppbar.appbar(
      appBar: homeAppBar(
        context,
        isExpanded,
        () {
          log("Turn");
          setState(() => isExpanded = !isExpanded);
        },
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
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
          ),
        ],
      ),
    );
  }
}
