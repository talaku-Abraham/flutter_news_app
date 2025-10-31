import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/providers/service_provider.dart';

class TempNotifier extends Notifier<AsyncValue<List<Article>>> {
  late final Repository _repo;
  @override
  AsyncValue<List<Article>> build() {
    _repo = ref.read(repositoryProvider);
    return AsyncValue.data([]);
  }

  Future<void> fetchAllNews(String source) async {
    state = AsyncValue.loading();

    print('inside the temp fetchallnwes');

    final articles = await _repo.fetchNewsByQuery(sources: 'ansa');
    print(articles);
    state = AsyncValue.data(articles);
  }
}
