import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/data/model/article.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsResult {
  String status;
  int totalResults;
  List<NewsArticle> articles;

  NewsResult({
    required this.status,
    required this.articles,
    required this.totalResults,
  });

  factory NewsResult.fromJson(Map<String, dynamic> json) =>
      _$NewsResultFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResultToJson(this);
}

@JsonSerializable()
class NewsArticle {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Source source;

  NewsArticle({
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.source,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);
}

@JsonSerializable()
class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

List<Article> NewsAPiArticleToArticle(NewsResult result) {
  List<Article> articles = [];

  for (final result in result.articles) {
    articles.add(NewArticleToArticle(result));
  }
  return articles;
}

Article NewArticleToArticle(NewsArticle article) {
  return Article(
    author: article.author,
    content: article.content,
    description: article.description,
    publishedAt: article.publishedAt,
    source: article.source.name,
    title: article.title,
    url: article.url,
    urlToImage: article.urlToImage,
  );
}
