import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/services/secure_storage_service.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/login/presentation/bloc/google_auth/google_auth_bloc.dart';
import 'package:carlog/features/auth_features/login/presentation/bloc/mail_login_bloc.dart';
import 'package:carlog/features/auth_features/login/presentation/widgets/login_by_mail_form_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/carlog_logo_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/change_auth_screen.dart';
import 'package:carlog/features/auth_features/shared/widgets/connect_by_services_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MailLoginBloc(
            locator(),
          ),
        ),
        BlocProvider(
          create: (context) => GoogleAuthBloc(
            locator(),
          ),
        ),
      ],
      child: const LoginPageView(),
    );
  }
}

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ChangeAuthScreen(
                  onPressed: () => context.go(RoutesK.register),
                  title: S.of(context).register,
                ),
                const CarlogLogoWidget(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    S.of(context).welocomeBack,
                    style: text22W700LS8Black87,
                  ),
                ),
                SizedBox(
                  width: width * .9,
                  height: 300,
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: LoginByMailFormWidget(),
                    ),
                  ),
                ),
                Padding(
                  padding: PaddingsK.v10,
                  child: Text(S.of(context).or),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<GoogleAuthBloc, GoogleAuthState>(
                      builder: (context, state) {
                        return ConnectByService(
                            isLoading: false,
                            onTap: () {
                              context
                                  .read<GoogleAuthBloc>()
                                  .add(const GoogleAuthEvent.firebaseLogin());
                            },
                            title: "Google",
                            asset: "assets/GoogleLogo1.png");
                      },
                    ),
                    // ConnectByService(
                    //     isLoading: false,
                    //     onTap: () {},
                    //     title: "Apple",
                    //     asset: context.isDark
                    //         ? "assets/appleLogo3.png"
                    //         : "assets/appleLogo1.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await SecureStorageService().resetFirstEntryToApp();
        },
      ),
    );
  }
}
