import 'package:carlog/core/addons/bloc_observer.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(BlocProvider.value(
    value: locator<AuthBloc>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        router.refresh();
      },
      child: MaterialApp.router(
        title: 'Carlog',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[900]!),
        ),
        darkTheme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue[900]!, brightness: Brightness.dark),
        ),
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
