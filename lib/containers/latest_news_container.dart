import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/screens/latest_news_screen.dart';

class LatestNewsContainer extends ConsumerWidget {
  const LatestNewsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestNewsState = ref.read(latestNewsNotifierProvider);
    return latestNewsState.when(
      data:
          (articles) =>
              LatestNewsScreen(articles: articles, category: 'Latest news'),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
