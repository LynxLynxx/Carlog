import 'package:carlog/core/addons/bloc_observer.dart';
import 'package:carlog/core/theme/theme.dart';
import 'package:carlog/core/web_router/router.dart';
import 'package:carlog/features/other_features/theme_mode/presentation/cubit/theme_mode_cubit.dart';
import 'package:carlog/features/settings_features/settings/presentation/cubit/language_cubit/language_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = MyBlocObserver();
  // configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeModeCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => LanguageCubit(Intl(), S()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Carlog Website',
          theme: const MaterialTheme().light(),
          darkTheme: const MaterialTheme().dark(),
          debugShowCheckedModeBanner: false,
          themeMode: context.watch<ThemeModeCubit>().state.themeMode,
          locale: context.watch<LanguageCubit>().state.currentLocal,
          routerConfig: webRouter,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
