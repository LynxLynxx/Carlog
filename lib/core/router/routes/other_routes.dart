import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/other_features/webview/presentation/pages/webview_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> otherRoutes = [
  GoRoute(
    path: RoutesK.webview,
    builder: (context, state) {
      // Extract the URL from the state.extra.
      final extra = state.extra as String;
      return WebviewPage(
        url: extra,
      );
    },
  ),
];
