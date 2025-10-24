import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_app/core/routes/routes.dart';
import 'package:study_app/features/home/presentation/view/pages/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  navigatorKey: navigatorKey,
  routes: [
    _customAnimatedGoRoute(route: Routes.home, page: (state) => HomePage()),
  ],
);

GoRoute _customAnimatedGoRoute({
  required String route,
  required Widget Function(GoRouterState state) page,
  Duration duration = const Duration(milliseconds: 450),
  Offset beginOffset = const Offset(1, 0),
  Offset endOffset = Offset.zero,
  Curve curve = Curves.easeInOut,
  List<GoRoute> routes = const [],
}) => GoRoute(
  path: route,
  routes: routes,
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: page(state),
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: endOffset,
        ).animate(CurvedAnimation(parent: animation, curve: curve)),
        child: child,
      );
    },
  ),
);

String getCurrentRoute(BuildContext context) {
  final location = GoRouterState.of(context).uri.toString();
  return location;
}
