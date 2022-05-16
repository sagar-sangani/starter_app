import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:starter_app/app/views/tasks_list.dart';

import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Widget testing', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      for (var task in TASK_LIST) {
        await tester.pumpAndSettle();
        final index = TASK_LIST.indexOf(task);

        final foundTask = find.textContaining('${index + 1}.');
        await tester.scrollUntilVisible(foundTask, 5);

        expect(foundTask, findsOneWidget);

        await tester.tap(foundTask);
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));

        await tester.pageBack();
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 1));

        print(foundTask.description);
      }
    });
  });
}
