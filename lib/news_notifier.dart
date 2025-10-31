import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/providers/service_provider.dart';

// class EveryNewsNotifier
//     extends
//         AutoDisposeFamilyNotifier<
//           AsyncValue<List<Article>>,
//           Map<String, dynamic>
//         > {
//   late final ApiRepository _repo;

//   late final String? q;
//   // late final String? sources;
//   bool _initialized = false;

//   @override
//   AsyncValue<List<Article>> build(Map<String, dynamic> query) {
//     _repo = ref.read(repositoryProvider);
//     q = query['q'];
//     // sources = query['sources'];
//     print('running build');
//     print('q: $q');

//     if (!_initialized) {
//       _initialized = true;
//       fetchEverything(q: q);
//     }
//     return const AsyncValue.loading();
//   }

//   Future<void> fetchEverything({
//     String? q,
//     String? domain,
//     String? source,
//   }) async {
//     state = const AsyncValue.loading();

//     try {
//       print('calling the api');
//       final articles = await _repo.fetchEverything(
//         q: q,
//         domains: domain,
//         sources: source,
//       );

//       state = AsyncValue.data(articles);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }

//   Future<void> reset() async {
//     print('iniside reset');
//     state = AsyncValue.data([]);
//     state = AsyncValue.loading();
//   }
// }

class EveryNewsNotifier
    extends FamilyNotifier<AsyncValue<List<Article>>, String?> {
  late final Repository _repo;
  late String? sources;

  bool _isInitialized = false;

  @override
  AsyncValue<List<Article>> build(String? sources) {
    _repo = ref.watch(repositoryProvider);
    print('build is called ');
    this.sources = sources;
    if (!_isInitialized) {
      _isInitialized = false;
      fetchEverything(q: 'bitcoin');
    }
    return const AsyncValue.data([]);
  }

  Future<void> fetchEverything({
    String? q,
    String? domain,
    String? source,
  }) async {
    print('fetchEverything called inside the notifier class');
    state = AsyncValue.loading();

    try {
      final articles = await _repo.fetchNewsByQuery(
        q: sources,
        domains: domain,
        sources: sources,
      );
      print('the returned articels inside the notifier method');
      // print(articles);

      state = AsyncValue.data(articles);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
