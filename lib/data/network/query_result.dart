import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/data/model/article.dart';

part 'query_result.g.dart';
part 'query_result.freezed.dart';

@freezed
class QueryResult with _$QueryResult {
  const factory QueryResult({
    required int totalResults,
    required List<Article> articles,
  }) = _QueryResult;

  factory QueryResult.fromJson(Map<String, dynamic> json) =>
      _$QueryResultFromJson(json);
}
