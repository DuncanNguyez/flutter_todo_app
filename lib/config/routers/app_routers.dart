import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routers/router_location.dart';
import 'package:todoapp/screens/screens.dart';

class AppRouters {
  const AppRouters._();
  static final GlobalKey<NavigatorState> _navigationKey =
      GlobalKey<NavigatorState>();

  static final List<GoRoute> _routers = [
    GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: _navigationKey,
      builder: HomeScreen.builder,
    ),
    GoRoute(
      path: RouteLocation.createTask,
      parentNavigatorKey: _navigationKey,
      builder: CreateTaskScreen.builder,
    ),
  ];

  static Provider<GoRouter> provider = Provider<GoRouter>(
    (ref) {
      return GoRouter(
        initialLocation: RouteLocation.home,
        navigatorKey: _navigationKey,
        routes: _routers,
      );
    },
  );
}
