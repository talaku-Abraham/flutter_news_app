import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/category_news_notifier.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/repositories/api_repository.dart';
import 'package:news_app/latest_news_notifier.dart';
import 'package:news_app/network/service_interface.dart';
import 'package:news_app/news_notifier.dart';

final serviceProvider = Provider<ServiceInterface>((ref) {
  throw UnimplementedError();
});

final repositoryProvider = Provider<ApiRepository>(
  (ref) => ApiRepository(ref.watch(serviceProvider)),
);

final newsNotifierProvider =
    NotifierProvider<NewsNotifier, AsyncValue<List<Article>>>(NewsNotifier.new);

final latestNewsNotifierProvider =
    NotifierProvider<LatestNewsNotifier, AsyncValue<List<Article>>>(
      LatestNewsNotifier.new,
    );
final categoryNewsNotifierProvider = NotifierProvider.family<
  CategoryNewsNotifier,
  AsyncValue<List<Article>>,
  String
>(CategoryNewsNotifier.new);
