import 'package:news_app/data/model/source.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/query_result.dart';
import 'package:chopper/chopper.dart';

typedef NewsResponse = Response<Result<QueryResult>>;

typedef SourceResponse = Response<Result<QuerySource>>;

abstract class ServiceInterface {
  Future<NewsResponse> queryEverything({
    String? q,
    String? sources,
    String? domains,
  });
  Future<NewsResponse> topHeadlines({
    String? country,
    String? category,
    String? sources,
    int? pageSize,
    int? page,
  });

  Future<SourceResponse> sources();
}
