import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';
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
    final res = await _service.queryEverything(
      q: q ?? 'bitcoin',
      domains: domains,
      sources: sources,
    );

    return returnListofArticles(res);
  }

  @override
  Future<List<Article>> fetchLatestNews({String? country}) async {
    final res = await _service.topHeadlines(country: country ?? 'us');

    return returnListofArticles(res);
  }

  @override
  Future<List<Article>> fatchByCategory({String category = 'sports'}) async {
    final res = await _service.topHeadlines(category: category);

    return returnListofArticles(res);
  }

  List<Article> returnListofArticles(NewsResponse res) {
    if (res.isSuccessful) {
      final result = res.body;

      if (result is Success<QueryResult>) {
        return result.value.articles;
      } else {
        throw Exception("Unexpected Success Response Type");
      }
    } else {
      final error = res.error;
      if (error is Error<QueryResult>) {
        throw Exception(error.exception);
      } else {
        throw Exception("Unexpected error message");
      }
    }
  }

  @override
  Future<List<SourceOfNews>> fetchAllSourceOfNews() async {
    final res = await _service.sources();

    if (res.isSuccessful) {
      final result = res.body;

      if (result is Success<QuerySource>) {
        // final List<SourceOfNews> a =
        return result.value.sources;
      } else {
        throw Exception("Unexpected success Response");
      }
    } else {
      throw Exception("Error is happening");
    }
  }

  @override
  Future<List<Article>> fetchAllNewsOfTheSource(String source) async {
    final res = await _service.topHeadlines(sources: source);
    return returnListofArticles(res);
  }
}
