import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/data/model/article.dart';

part 'current_news.freezed.dart';

@freezed
class CurrentNews with _$CurrentNews {
  const factory CurrentNews({
    @Default(<Article>[]) List<Article> articles,
    @Default(<Article>[]) List<Article> latestArticles,
  }) = _CurrentNews;
}
