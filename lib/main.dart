import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/app_router.dart';
import 'package:news_app/network/news_service.dart';
import 'package:news_app/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final service = NewsService.create();

  final router = createAppRouter();
  runApp(
    ProviderScope(
      overrides: [serviceProvider.overrideWithValue(service)],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
