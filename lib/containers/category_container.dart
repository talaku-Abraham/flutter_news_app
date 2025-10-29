import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/screens/latest_news_screen.dart';

class CategoryContainer extends ConsumerWidget {
  const CategoryContainer({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsync = ref.watch(categoryNewsNotifierProvider(category));

    return articlesAsync.when(
      data:
          (articles) =>
              LatestNewsScreen(articles: articles, category: category),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
