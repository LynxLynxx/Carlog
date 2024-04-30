import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/register/presentation/widgets/register_by_mail_form_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/carlog_logo_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/change_auth_screen.dart';
import 'package:carlog/features/auth_features/shared/widgets/connect_by_services_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,/
              children: [
                ChangeAuthScreen(
                  onPressed: () {},
                  title: 'Zaloguj',
                ),
                const CarlogLogoWidget(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Stwórz Konto!",
                    style: text22W700LS8Black87,
                  ),
                ),
                SizedBox(
                  width: width * .9,
                  height: 280,
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: RegisterByMailFormWidget(),
                    ),
                  ),
                ),
                const Text("LUB"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConnectByService(
                        isLoading: false,
                        onTap: () {},
                        title: "Google",
                        asset: "assets/GoogleLogo1.png"),
                    ConnectByService(
                        isLoading: false,
                        onTap: () {},
                        title: "Apple",
                        asset: Theme.of(context).brightness == Brightness.dark
                            ? "assets/appleLogo3.png"
                            : "assets/appleLogo1.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
