import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:id_379/screens/screens.dart';

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class RouterController {
  final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (_, state, child) => NavigationScreen(
          path: state.fullPath!,
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (_, state) => buildPageWithDefaultTransition(
              context: _,
              state: state,
              child: const SettingsScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
