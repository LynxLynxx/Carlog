import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/login/presentation/bloc/google_auth/google_auth_bloc.dart';
import 'package:carlog/features/auth_features/register/presentation/bloc/mail_register/mail_register_bloc.dart';
import 'package:carlog/features/auth_features/register/presentation/widgets/register_by_mail_form_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/carlog_logo_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/change_auth_screen.dart';
import 'package:carlog/features/auth_features/shared/widgets/connect_by_services_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MailRegisterBloc(
            locator(),
          ),
        ),
        BlocProvider(
          create: (context) => GoogleAuthBloc(
            locator(),
          ),
        ),
      ],
      child: const RegisterPageView(),
    );
  }
}

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,/
                children: [
                  ChangeAuthScreen(
                    onPressed: () => context.go(RoutesK.login),
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
                    height: 300,
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
                  const Padding(
                    padding: PaddingsK.v10,
                    child: Text("LUB"),
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
                      //     asset: Theme.of(context).brightness == Brightness.dark
                      //         ? "assets/appleLogo3.png"
                      //         : "assets/appleLogo1.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "1",
              child: const Icon(Icons.error),
              onPressed: () => context.go(RoutesK.unknownError),
            ),
            FloatingActionButton(
              heroTag: "2",
              child: const Icon(Icons.wifi),
              onPressed: () => context.go(RoutesK.connectionLostError),
            ),
            FloatingActionButton(
              heroTag: "3",
              child: const Icon(Icons.next_plan),
              onPressed: () => context.go(RoutesK.loading),
            ),
          ],
        ),
      ),
    );
  }
}
