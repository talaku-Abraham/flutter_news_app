import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:news_app/widgets/build_image.dart';

void main() {
  testWidgets('BuildImage Display image correctly ', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BuildImage(imageUrl: ''))),
      );
    });

    await tester.pumpAndSettle();
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);

    expect(imageWidget.fit, BoxFit.cover);

    final clipRrectFinder = find.byType(ClipRRect);

    expect(clipRrectFinder, findsOneWidget);
    final clipRrectWidget = tester.widget<ClipRRect>(clipRrectFinder);

    expect(clipRrectWidget.borderRadius, BorderRadius.circular(11));
  });
}
