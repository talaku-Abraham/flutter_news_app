import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/current_news.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/network/model_response.dart';
import 'package:news_app/network/query_result.dart';
import 'package:news_app/network/service_interface.dart';
import 'package:news_app/providers/service_provider.dart';

class ApiRepository extends Notifier<AsyncValue<CurrentNews>>
    implements Repository {
  late final ServiceInterface _service;

  @override
  build() {
    _service = ref.watch(serviceProvider);
    return AsyncValue.data(CurrentNews());
  }

  @override
  Future<void> fetchEverything({
    String? q,
    String? sources,
    String? domains,
  }) async {
    try {
      state = AsyncValue.loading();
      final response = await _service.queryNews(
        q: q ?? 'bitcoin',
        sources: sources,
        domains: domains,
      );
      final result = response.body;

      // print(response.body);
      if (result is Success<QueryResult>) {
        final old = state.value ?? CurrentNews();
        state = AsyncValue.data(
          old.copyWith(articles: result.value.articles),
          // CurrentNews(articles: result.value.articles)
        );
      } else if (result is Error<QueryResult>) {
        state = AsyncValue.error(result.exception, StackTrace.current);
      } else if (result == null && response.error != null) {
        // response.body is null but response.error exists
        state = AsyncValue.error(response.error!, StackTrace.current);
      } else {
        throw Exception("Unexpected response type: $result");
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  @override
  void fetchLatestNews({String? country}) async {
    try {
      state = AsyncValue.loading();

      final response = await _service.queryLatestNews(country: 'us');

      final result = response.body;

      if (result is Success<QueryResult>) {
        final old = state.value ?? CurrentNews();

        state = AsyncValue.data(
          old.copyWith(latestArticles: result.value.articles),
        );
      } else if (result is Error<QueryResult>) {
        state = AsyncValue.error(result.exception, StackTrace.current);
      } else {
        throw Exception("Unexpected response type : $result");
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
