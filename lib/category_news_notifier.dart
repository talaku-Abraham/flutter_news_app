import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/providers/service_provider.dart';

class CategoryNewsNotifier
    extends FamilyNotifier<AsyncValue<List<Article>>, String> {
  late final Repository _repo;
  late final String category;

  CategoryNewsNotifier();

  @override
  AsyncValue<List<Article>> build(String category) {
    _repo = ref.watch(repositoryProvider);
    this.category = category;
    fetchNewsByCategory();

    return AsyncValue.loading();
  }

  Future<void> fetchNewsByCategory() async {
    state = AsyncValue.loading();

    try {
      final articles = await _repo.fatchByCategory(category: category);

      state = AsyncValue.data(articles);
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }
}
