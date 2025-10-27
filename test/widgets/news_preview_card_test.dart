import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/screens/detail_screen.dart';
import 'package:news_app/widgets/news_preview_card.dart';

import '../fakes/fake_data.dart';

void main() {
  testWidgets('NewsPreviewCard navigate to detail', (tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder:
              (context, state) =>
                  Scaffold(body: NewsPreviewCard(article: fakeArticles.first)),
        ),
        GoRoute(
          path: '/home/detail',
          builder: (context, state) {
            final article = state.extra as Article;
            return Scaffold(body: Text(article.title));
          },
        ),
      ],
    );
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    });

    await tester.pumpAndSettle();

    final inkWellFinder = find.byType(InkWell);

    expect(inkWellFinder, findsOneWidget);

    await tester.tap(inkWellFinder);

    await tester.pumpAndSettle();

    final detailScreen = find.byType(Text);

    expect(detailScreen, findsOneWidget);
    final textWidget = tester.widget<Text>(detailScreen);

    expect(
      textWidget.data,
      equalsIgnoringCase("Under Trump, ‘Bitcoin Jesus’ May Be Redeemed"),
    );
  });
}
