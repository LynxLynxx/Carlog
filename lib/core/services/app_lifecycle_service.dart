import 'package:carlog/core/extensions/gorouter_extension.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/core/services/appopen_service.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppLifecycleService {
  final AppOpenAdManager appOpenAdManager;

  AppLifecycleService({required this.appOpenAdManager}) {
    listenToAppStateChanges();
  }

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    final context = rootNavigatorKey.currentContext;
    if (appState == AppState.foreground &&
        context != null &&
        GoRouter.of(context).showAppOpenAd) {
      appOpenAdManager.showAdIfAvailable();
    }
  }
}
