import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/providers/service_provider.dart';

class CategoryNewsNotifier
    extends FamilyNotifier<AsyncValue<List<Article>>, String> {
  late final ApiRepository _repo;
  late final String category;

  CategoryNewsNotifier();

  @override
  AsyncValue<List<Article>> build(String category) {
    _repo = ref.watch(repositoryProvider);
    category = category;
    fetchNewsByCategory(category);

    return AsyncValue.data([]);
  }

  Future<void> fetchNewsByCategory(String category) async {
    state = AsyncValue.loading();

    try {
      final articles = await _repo.fatchByCategory(category: category);

      state = AsyncValue.data(articles);
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }
}
