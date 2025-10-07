import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/providers/user_provider.dart';

String? appRedirect(Ref ref, BuildContext context, GoRouterState state) {
  final isUserLogged = ref.read(isUserLoggedInProvider);

  final loggingIn = state.matchedLocation == '/login';

  if (isUserLogged && loggingIn) return '/home';

  if (!loggingIn) return '/login';

  return null;
}
