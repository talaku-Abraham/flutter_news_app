import 'dart:async';

import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/data/network/service_interface.dart';
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

@Riverpod(keepAlive: true)
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

@Riverpod(keepAlive: true)
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
  print('init: newsBySourceProvider');
  ref.onDispose(() => print('destroyed newsBySourceProvider'));
  ref.onCancel(() => print('canceled: newsBySourceProvider'));
  ref.onResume(() => print('resumed: newsBySourceProvider'));
  final link = ref.keepAlive();

  Timer? timer;

  ref.onCancel(() {
    print('timer set for 10 seconds');
    timer = Timer(Duration(seconds: 10), () => link.close());
  });

  ref.onResume(() {
    print('timer got cancelled in resume');
    timer?.cancel();
  });

  ref.onDispose(() {
    print('timer got cancelled on dispose');
    timer?.cancel();
  });

  return ref.watch(repositoryProvider).fetchNewsBySource(source: source);
}

@Riverpod(keepAlive: true)
Future<List<SourceOfNews>> sourceOfNews(SourceOfNewsRef ref) {
  print('init: sourceOfNewsProvider');
  ref.onDispose(() => print('destroyed sourceOfNewsProvider'));
  ref.onCancel(() => print('canceled: sourceOfNewsProvider'));
  ref.onResume(() => print('resumed: sourceOfNewsProvider'));

  return ref.watch(repositoryProvider).fetchAllSourceOfNews();
}
