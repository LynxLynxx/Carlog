import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardAppbar.title(
      title: "Home",
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
      body: Center(
        child: TextButton(
          child: Column(
            children: [
              const Text("ASD"),
              Text(FirebaseAuth.instance.currentUser?.displayName ?? "NO NAME"),
              Text(FirebaseAuth.instance.currentUser?.uid ?? "NO UID"),
            ],
          ),
          onPressed: () => context.push("/add"),
        ),
      ),
    );
  }
}
