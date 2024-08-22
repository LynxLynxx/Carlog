import 'package:carlog/core/router/routes_constants.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtension on GoRouter {
  String location() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }

  bool get showNavBar {
    if (location() == RoutesK.addAction || location() == RoutesK.addMilage) {
      return false;
    }
    return location().split("/").length >= 3 ? false : true;
  }
}
