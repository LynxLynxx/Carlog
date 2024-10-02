import 'dart:js' as js;
import 'dart:ui';

import 'package:carlog/core/addons/bloc_observer.dart';
import 'package:carlog/core/theme/theme.dart';
import 'package:carlog/core/web_router/router.dart';
import 'package:carlog/features/other_features/theme_mode/presentation/cubit/theme_mode_cubit.dart';
import 'package:carlog/features/settings_features/settings/presentation/cubit/language_cubit/language_cubit.dart';
import 'package:carlog/firebase_options.dart';
import 'package:carlog/shared/device/presentation/cubit/device_cubit.dart';
import 'package:carlog/shared/events/presentation/cubit/events_cubit.dart';
import 'package:carlog/web_features/web_contact/domain/repositories/contact_repository.dart';
import 'package:carlog/web_features/web_contact/domain/usecases/send_email_usecase.dart';
import 'package:carlog/web_features/web_contact/presentation/cubit/web_contact_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseConfig = js.context['firebaseConfig'];
  if (firebaseConfig == null) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: firebaseConfig['FIREBASE_API_KEY'],
        authDomain: firebaseConfig['FIREBASE_AUTH_DOMAIN'],
        projectId: firebaseConfig['FIREBASE_PROJECT_ID'],
        storageBucket: firebaseConfig['FIREBASE_STORAGE_BUCKET'],
        messagingSenderId: firebaseConfig['FIREBASE_MESSAGING_SENDER_ID'],
        appId: firebaseConfig['FIREBASE_APP_ID'],
        measurementId: firebaseConfig['FIREBASE_MEASUREMENT_ID'],
      ),
    );
  }

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeModeCubit()..changeTheme(ThemeMode.light),
      ),
      BlocProvider(
        create: (context) =>
            WebContactCubit(SendEmailUsecase(ContactRepositoryImpl())),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => LanguageCubit(Intl(), S()),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => DeviceCubit(),
      ),
      BlocProvider(
        create: (context) => EventsCubit(context.read<DeviceCubit>()),
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
          scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.unknown,
          }),
        );
      },
    );
  }
}
