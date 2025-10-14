import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/providers/service_provider.dart';

class LatestNewsNotifier extends Notifier<AsyncValue<List<Article>>> {
  late final ApiRepository _repo;
  @override
  AsyncValue<List<Article>> build() {
    _repo = ref.watch(repositoryProvider);
    return AsyncValue.data([]);
  }

  Future<void> fetchLatestNews() async {
    state = AsyncValue.loading();
    try {
      final articles = await _repo.fetchLatestNews();
      state = AsyncValue.data(articles);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
