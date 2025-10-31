import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/screens/latest_news_screen.dart';

class NewsBySourceContainer extends ConsumerWidget {
  const NewsBySourceContainer({super.key, required this.source});

  final String source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsStatus = ref.watch(newsBySourceProvider(source: source));

    return newsStatus.when(
      data:
          (articles) => LatestNewsScreen(articles: articles, category: source),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
