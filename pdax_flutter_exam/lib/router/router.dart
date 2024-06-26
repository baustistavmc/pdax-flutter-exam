import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

// ========== Variables ========== //

final navigatorKey = GlobalKey<NavigatorState>();

List<GoRoute> get routes => [
      // ================= Profile List Screen ================= //
      GoRoute(
        name: 'ProfileListScreen',
        path: '/profile_list',
        // builder: (context, state) => const ProfileList(),
      ),
    ];

@riverpod
GoRouter goRoute(GoRouteRef ref) {
  return GoRouter(
    routes: routes,
    initialLocation: '/profile_list',
  );
}
