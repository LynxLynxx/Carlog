import 'package:carlog/core/extensions/string_extension.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:flutter/material.dart';
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
    if (location() == RoutesK.addAction ||
        location() == RoutesK.addMilage ||
        location() == RoutesK.addExpense) {
      return false;
    }
    return location().split("/").length >= 3 ? false : true;
  }
}

extension GoRouterAnalytycsExtension on BuildContext {
  void goAndTrack(String location, {Object? extra}) {
    GoRouter.of(this).go(location, extra: extra);
    // FirebaseAnalytics.instance.logScreenView(
    //     screenName: getRouteName(location).$2,
    //     screenClass: getRouteName(location).$1,
    //     parameters: {'extra': extra.toString()});
  }

  void goNamedAndTrack(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(this).goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
    // FirebaseAnalytics.instance.logScreenView(
    //     screenName: getRouteName(name).$2,
    //     screenClass: getRouteName(name).$1,
    //     parameters: {'extra': extra.toString()});
  }

  Future<T?> pushAndTrack<T extends Object?>(String location, {Object? extra}) {
    // FirebaseAnalytics.instance.logScreenView(
    //     screenClass: getRouteName(location).$1,
    //     screenName: getRouteName(location).$2,
    //     parameters: {'extra': extra.toString()});
    return GoRouter.of(this).push<T>(location, extra: extra);
  }

  Future<T?> pushNamedAndTrack<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    // FirebaseAnalytics.instance.logScreenView(
    //     screenClass: getRouteName(name).$1,
    //     screenName: getRouteName(name).$2,
    //     parameters: {'extra': extra.toString()});
    return GoRouter.of(this).pushNamed<T>(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}

extension StatefulNavigationShellExtension on StatefulNavigationShell {
  Future<void> goBranchAndTrack(int index,
      {bool initialLocation = false}) async {
    final String location = shellBranchesNames[index];
    // FirebaseAnalytics.instance.logScreenView(
    //   screenClass: getRouteName(location).$1,
    //   screenName: getRouteName(location).$2,
    // );
    goBranch(index, initialLocation: initialLocation);
  }
}

(String, String) getRouteName(String location) {
  if (location == '/') {
    return ("HomeScreen", "home");
  } else if (location.contains("details")) {
    return ("DetailScreen", "detail");
  }
  final List<String> locationParts = location.split('/');
  return ("${locationParts.last.capitalize()}Screen", locationParts.last);
}
