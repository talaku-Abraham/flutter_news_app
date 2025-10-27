import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/query_result.dart';
import 'package:chopper/chopper.dart';

typedef NewsResponse = Response<Result<QueryResult>>;

abstract class ServiceInterface {
  Future<NewsResponse> topHeadlines({
    String? q,
    String? sources,
    String? domains,
    String? category,
  });
  Future<NewsResponse> queryLatestNews({String? country});
}
