import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';

abstract class Repository {
  Future<List<Article>> fetchNewsByQuery({
    String? q,
    String? sources,
    String? domains,
    String? sortBy,
    String? language,

    // popularity
  });

  Future<List<Article>> fetchNewsByCountry({required String country});

  Future<List<Article>> fetchNewsByCategory({required String category});

  Future<List<SourceOfNews>> fetchAllSourceOfNews();

  Future<List<Article>> fetchNewsBySource({required String source});
}
