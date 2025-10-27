import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/latest_news_notifier.dart';
import 'package:news_app/news_notifier.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/screens/home_screen.dart';

import '../fakes/fake_data.dart';

void main() {
  testWidgets('clicking on top story navigate to list of latest news', (
    tester,
  ) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            newsNotifierProvider.overrideWith(FakeNewsNotifier.new),
            latestNewsNotifierProvider.overrideWith(FakeLatestNewsNotifier.new),
          ],
          child: MaterialApp(home: SingleChildScrollView(child: HomeScreen())),
        ),
      );
      await tester.pumpAndSettle();
    });

    // expect(fakeNewsNotifier.fetchCalled, isTrue);
  });
}

class FakeLatestNewsNotifier extends LatestNewsNotifier {
  @override
  AsyncValue<List<Article>> build() {
    return AsyncValue.data([]);
  }

  bool fetchCalled = false;

  @override
  Future<void> fetchLatestNews() async {
    fetchCalled = true;
    state = AsyncValue.data(fakeArticles);
  }
}

class FakeNewsNotifier extends NewsNotifier {
  @override
  AsyncValue<List<Article>> build() {
    return AsyncValue.data([]);
  }

  bool fetchCalled = false;

  @override
  Future<void> fetchEverything({
    String? q,
    String? domain,
    String? source,
  }) async {
    fetchCalled = true;
    state = AsyncValue.data(fakeArticles);
  }
}
// final fakeLatestNewNotifierProvider =
//     NotifierProvider<LatestNewsNotifier, AsyncValue<List<Article>>>(
//       () => FakeLatestNewsNotifier(fakeArticles),
//     );

// final fakeNewsNotifierProvider =
//     NotifierProvider<NewsNotifier, AsyncValue<List<Article>>>(
//       () => FakeNewsNotifier(fakeArticles),
//     );
