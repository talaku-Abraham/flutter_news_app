import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/widgets/news_preview_card.dart';

class LatestNewsScreen extends ConsumerWidget {
  const LatestNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsync = ref.watch(latestNewsNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Latest News')),
      body: articlesAsync.when(
        data:
            (articles) => ListView.builder(
              itemBuilder:
                  (context, index) => NewsPreviewCard(article: articles[index]),
              itemCount: articles.length,
            ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
