import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/widgets/news_preview_card.dart';

class LatestNewsScreen extends StatelessWidget {
  const LatestNewsScreen({
    super.key,
    required this.articles,
    required this.category,
  });

  final List<Article> articles;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemBuilder:
            (context, index) => NewsPreviewCard(article: articles[index]),
        itemCount: articles.length,
      ),
    );
  }
}
