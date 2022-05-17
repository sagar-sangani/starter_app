import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:starter_app/app/models/task.dart';
import 'package:starter_app/app/views/tasks_list.dart';

import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  gotoTask(WidgetTester tester, Task task) async {
    final foundTask = find.byKey(ValueKey(task.name));

    await tester.scrollUntilVisible(foundTask, 100);

    await tester.ensureVisible(foundTask);

    await tester.pumpAndSettle();

    expect(foundTask, findsOneWidget);

    await tester.tap(foundTask);

    await tester.pumpAndSettle();
  }

  goBack(WidgetTester tester) async {
    await tester.flingFrom(
      const Offset(0, 300),
      const Offset(300, 0),
      2000,
    );

    await tester.pumpAndSettle();
  }

  group('end-to-end test', () {
    testWidgets('Widget testing', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      for (var task in TASK_LIST) {
        await tester.pumpAndSettle();
        final index = TASK_LIST.indexOf(task);

        await gotoTask(tester, TASK_LIST[index]);
        await goBack(tester);
      }
    });
  });

  group('Individual test', () {
    testWidgets('Registration screen test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 1));

      await gotoTask(tester, TASK_LIST[14]);

      await Future.delayed(const Duration(seconds: 2));
      final passwordField = find.byKey(const ValueKey('passwordInput'));

      const password = '12345678901234';

      int cursorCount = 0;

      for (var value in password.split('')) {
        await Future.delayed(const Duration(milliseconds: 300));
        await tester.enterText(
            passwordField, password.substring(0, cursorCount + 1));
        await tester.pumpAndSettle();

        cursorCount++;
      }
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 3));
    });
  });
}
