import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/network/service_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_provider.g.dart';

final serviceProvider = Provider<ServiceInterface>((ref) {
  throw UnimplementedError();
});

final repositoryProvider = Provider<Repository>(
  (ref) =>
  // MockRepository(),
  ApiRepository(ref.watch(serviceProvider)),
);

@riverpod
Future<List<Article>> newsByQuery(
  NewsByQueryRef ref, {
  required String q,
  String? language,
  String? sortBy,
}) {
  return ref
      .watch(repositoryProvider)
      .fetchNewsByQuery(q: q, language: language, sortBy: sortBy);
}

@riverpod
Future<List<Article>> newsByCategory(
  NewsByCategoryRef ref, {
  required String category,
}) {
  return ref.watch(repositoryProvider).fetchNewsByCategory(category: category);
}

@riverpod
Future<List<Article>> newsBySource(
  NewsBySourceRef ref, {
  required String source,
}) {
  return ref.watch(repositoryProvider).fetchNewsBySource(source: source);
}

@riverpod
Future<List<SourceOfNews>> sourceOfNews(SourceOfNewsRef ref) {
  return ref.watch(repositoryProvider).fetchAllSourceOfNews();
}

// final tempNotifierProvider =
//     NotifierProvider<TempNotifier, AsyncValue<List<Article>>>(TempNotifier.new);

// final latestNewsNotifierProvider =
//     NotifierProvider<LatestNewsNotifier, AsyncValue<List<Article>>>(
//       LatestNewsNotifier.new,
//     );
// final categoryNewsNotifierProvider = NotifierProvider.family<
//   CategoryNewsNotifier,
//   AsyncValue<List<Article>>,
//   String
// >(CategoryNewsNotifier.new);

// final everyNewsNotifierProvider = NotifierProvider.family<
//   EveryNewsNotifier,
//   AsyncValue<List<Article>>,
//   String?
// >(EveryNewsNotifier.new);

// final newsByQueryProvider = FutureProvider.autoDispose
//     .family<List<Article>, String>((ref, q) async {
//       final repo = ref.read(repositoryProvider);
//       return await repo.fetchNewsByQuery(q: q);
//     });
// final sourcesNotifierProvider =
//     NotifierProvider<SourceNotifier, AsyncValue<List<SourceOfNews>>>(
//       SourceNotifier.new,
//     );
