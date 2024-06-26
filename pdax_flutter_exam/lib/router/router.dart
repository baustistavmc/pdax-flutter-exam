import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdax_flutter_exam/feature/presentation/screens/person_list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

// ========== Variables ========== //

final navigatorKey = GlobalKey<NavigatorState>();

List<GoRoute> get routes => [
      // ================= Profile List Screen ================= //
      GoRoute(
        name: 'ProfileListScreen',
        path: '/',
        redirect: (context, state) => '/',
        builder: (context, state) => const PersonListScreen(),
      ),
    ];

@riverpod
GoRouter goRoute(GoRouteRef ref) {
  return GoRouter(
    routes: routes,
    initialLocation: '/',
  );
}
