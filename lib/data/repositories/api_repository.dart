import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/query_result.dart';
import 'package:news_app/network/service_interface.dart';

class ApiRepository implements Repository {
  final ServiceInterface _service;

  ApiRepository(this._service);

  @override
  Future<List<Article>> fetchEverything({
    String? q,
    String? sources,
    String? domains,
  }) async {
    final res = await _service.queryNews(
      q: q ?? 'bitcoin',
      domains: domains,
      sources: sources,
    );

    final result = res.body;

    print(result);

    if (result is Success<QueryResult>) {
      return result.value.articles;
    } else if (result is Error<QueryResult>) {
      throw result.exception;
    } else {
      throw Exception('UnExpected response');
    }
  }

  @override
  Future<List<Article>> fetchLatestNews({String? country}) async {
    final res = await _service.queryLatestNews(country: country);

    final result = res.body;

    if (result is Success<QueryResult>) {
      return result.value.articles;
    } else if (result is Error<QueryResult>) {
      throw result.exception;
    } else {
      throw Exception('Unexpected Response');
    }
  }
}
