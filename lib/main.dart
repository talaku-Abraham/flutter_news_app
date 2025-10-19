import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news_app/firebase_options.dart';
import 'package:news_app/network/news_service.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/providers/route_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final service = NewsService.create();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      overrides: [serviceProvider.overrideWithValue(service)],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        textTheme: ThemeData.light().textTheme
            .apply(
              bodyColor: Colors.deepOrange.shade900,
              displayColor: Colors.deepOrange.shade800,
            )
            .copyWith(
              headlineLarge: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              headlineMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 4,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surface,

        useMaterial3: true,
      ),

      routerConfig: router,
    );
  }
}
