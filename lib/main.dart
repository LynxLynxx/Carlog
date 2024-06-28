import 'package:carlog/core/addons/bloc_observer.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/core/theme/theme.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/bloc/tutorial/tutorial_bloc.dart';
import 'package:carlog/features/other_features/error/presentation/cubit/network_connection_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(
        value: locator<AuthBloc>()..add(const AuthEvent.getUserSession()),
      ),
      BlocProvider(
        create: (context) => TutorialBloc(locator())
          ..add(const TutorialEvent.readFirstEntryToApp()),
      ),
      BlocProvider(
        create: (context) => NetworkConnectionCubit(),
        lazy: false,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            router.refresh();
          },
        ),
        BlocListener<NetworkConnectionCubit, NetworkConnectionState>(
          listener: (context, state) {
            //TODO uncomment on release
            // if (state.connectionStatus == ConnectionStatus.disconnected) {
            //   router.push(RoutesK.connectionLostError);
            // }
          },
        ),
        BlocListener<TutorialBloc, TutorialState>(
          listener: (context, state) {
            router.refresh();
          },
        ),
      ],
      child: MaterialApp.router(
        title: 'Carlog',
        theme: const MaterialTheme().light(),
        darkTheme: const MaterialTheme().dark(),
        routerConfig: router,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
