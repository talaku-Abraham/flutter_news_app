// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:news_app/main.dart';
import 'package:news_app/widgets/custom_button.dart';

void main() {
  Widget buildWrapperWidget(Widget child) {
    return MaterialApp(home: Scaffold(body: Center(child: child)));
  }

  var tapped = false;
  testWidgets('calls OnTap when button is pressed', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      buildWrapperWidget(
        CustomButton(label: "click me", onTap: () => tapped = true),
      ),
    );

    final button = find.text('click me');
    await tester.tap(button);
    await tester.pump(Durations.extralong1);

    expect(tapped, true);
  });

  // testGoldens('button looks correct', (tester) async {
  //   final builder =
  //       GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
  //         ..addScenario(
  //           'click here',
  //           Material(
  //             child: SizedBox(
  //               width: 200,
  //               height: 60,
  //               child: CustomButton(label: 'click here', onTap: () {}),
  //             ),
  //           ),
  //         )
  //         ..addScenario('log in', CustomButton(label: 'log in', onTap: () {}))
  //         ..addScenario(
  //           'log out',
  //           CustomButton(label: 'log out', onTap: () {}),
  //         );

  //   await tester.pumpWidgetBuilder(
  //     builder.build(),
  //     wrapper: materialAppWrapper(
  //       theme: ThemeData.light().copyWith(
  //         outlinedButtonTheme: OutlinedButtonThemeData(
  //           style: OutlinedButton.styleFrom(
  //             side: BorderSide(), // ✅ ensure visible outline
  //             padding: EdgeInsets.all(16),
  //             backgroundColor: Colors.white, // ✅ avoid black fill
  //           ),
  //         ),
  //       ),
  //     ),
  //   );

  //   await tester.pump(const Duration(milliseconds: 100));

  //   await screenMatchesGolden(tester, 'custom_button');
  // });
}
