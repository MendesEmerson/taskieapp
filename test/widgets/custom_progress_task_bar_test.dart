import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskieapp/presentation/widgets/custom_progress_task_bar.dart';

void main() {
  testWidgets("Teste de renderização do custom progress task bar", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomProgressTaskBarWidget(
            totalTasks: 5,
            taskDone: 3,
          ),
        ),
      ),
    );

    expect(find.byType(CustomProgressTaskBarWidget), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Todas as tarefas'), findsOneWidget);
    expect(find.text('5 Tarefas'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

  });
}
