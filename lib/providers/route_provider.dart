import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/navigation_logic.dart';
import 'package:news_app/providers/firebase_provider.dart';
import 'package:news_app/routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: appRoutes,
    redirect: (context, state) => appRedirect(ref, context, state),
    refreshListenable: GoRouterRefreshProvider(ref.watch(authStateProvider)),
  );
});

class GoRouterRefreshProvider extends ChangeNotifier {
  GoRouterRefreshProvider(AsyncValue<dynamic> provider) {
    provider.when(
      data: (data) => notifyListeners(),
      error: (error, stackTrace) => {},
      loading: () => {},
    );
  }
}
