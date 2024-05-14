import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardAppbar.title(
        title: "Settings",
        body: Center(
          child: Column(
            children: [
              const Text("Settings"),
              TextButton(
                  onPressed: () => context
                      .read<AuthBloc>()
                      .add(const AuthEvent.appLogoutRequested()),
                  child: const Text("Wyloguj"))
            ],
          ),
        ));
  }
}
