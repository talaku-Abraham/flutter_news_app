import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';

abstract class Repository {
  Future<List<Article>> fetchEverything({
    String? q,
    String? sources,
    String? domains,
  });

  Future<List<Article>> fetchLatestNews({String? country});

  Future<List<Article>> fatchByCategory({String category = 'sports'});

  Future<List<SourceOfNews>> fetchAllSourceOfNews();

  Future<List<Article>> fetchAllNewsOfTheSource(String source);
}
