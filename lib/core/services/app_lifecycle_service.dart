import 'package:carlog/core/services/appopen_service.dart';
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
    if (appState == AppState.foreground) {
      appOpenAdManager.showAdIfAvailable();
    }
  }
}
