import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/gorouter_extension.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/login/presentation/bloc/google_auth/google_auth_bloc.dart';
import 'package:carlog/features/auth_features/login/presentation/cubit/microsoft_auth_cubit.dart';
import 'package:carlog/features/auth_features/register/presentation/bloc/mail_register/mail_register_bloc.dart';
import 'package:carlog/features/auth_features/register/presentation/widgets/register_by_mail_form_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/carlog_logo_widget.dart';
import 'package:carlog/features/auth_features/shared/widgets/change_auth_screen.dart';
import 'package:carlog/features/auth_features/shared/widgets/connect_by_services_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider(
          create: (context) => MicrosoftAuthCubit(
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
                children: [
                  ChangeAuthScreen(
                    onPressed: () => context.goAndTrack(RoutesK.login),
                    title: S.of(context).login,
                  ),
                  const CarlogLogoWidget(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      S.current.createAccount,
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
                      BlocSelector<MicrosoftAuthCubit, MicrosoftAuthState,
                          bool>(
                        selector: (state) {
                          return state.maybeWhen(
                              orElse: () => false, loading: () => true);
                        },
                        builder: (context, state) {
                          return ConnectByService(
                              isLoading: state,
                              onTap: () async {
                                context
                                    .read<MicrosoftAuthCubit>()
                                    .loginWithMicrosoft();
                              },
                              title: "Microsoft",
                              asset: "assets/MicrosoftLogo1.png");
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
      ),
    );
  }
}
