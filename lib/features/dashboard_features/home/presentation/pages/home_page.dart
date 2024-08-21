import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarlogScaffold.title(
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
