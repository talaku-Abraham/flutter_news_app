import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/firebase_provider.dart';

final isUserLoggedInProvider = Provider<bool>((ref) {
  final user = ref.watch(authStateProvider).value;

  return user != null;
});
