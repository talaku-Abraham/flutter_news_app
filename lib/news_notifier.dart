import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/providers/service_provider.dart';

class NewsNotifier extends Notifier<AsyncValue<List<Article>>> {
  late final ApiRepository _repo;

  @override
  AsyncValue<List<Article>> build() {
    _repo = ref.watch(repositoryProvider);
    return const AsyncValue.data([]);
  }

  Future<void> fetchEverything({
    String? q,
    String? domain,
    String? source,
  }) async {
    state = AsyncValue.loading();

    try {
      final articles = await _repo.fetchEverything(
        q: q,
        domains: domain,
        sources: source,
      );

      state = AsyncValue.data(articles);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
