import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/source.dart';

import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/providers/service_provider.dart';

class SourceNotifier extends Notifier<AsyncValue<List<SourceOfNews>>> {
  late final Repository _repo;
  @override
  AsyncValue<List<SourceOfNews>> build() {
    _repo = ref.watch(repositoryProvider);
    getSources();
    return AsyncValue.loading();
  }

  Future<void> getSources() async {
    state = AsyncValue.loading();
    try {
      final allSources = await _repo.fetchAllSourceOfNews();
      state = AsyncValue.data(allSources);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
