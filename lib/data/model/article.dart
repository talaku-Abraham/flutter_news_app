import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.g.dart';
part 'article.freezed.dart';

@Freezed()
class Article with _$Article {
  factory Article({
    required String author,
    required String content,
    required String description,
    required String publishedAt,
    required String source,
    required String title,
    required String url,
    required String urlToImage,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
