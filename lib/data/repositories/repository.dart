import 'package:news_app/data/model/article.dart';

abstract class Repository {
  Future<List<Article>> fetchEverything({
    String? q,
    String? sources,
    String? domains,
  });

  Future<List<Article>> fetchLatestNews({String? country});
}
