import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskieapp/presentation/widgets/custom_card_category.dart';

void main() {
  testWidgets("Teste de renderização do custom card category", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomCardCategoryWidget(
            categoryName: 'Família',
            quantidadeTarefas: 5,
            quantidadeTarefasDone: 3,
          ),
        ),
      ),
    );

    expect(find.byType(CustomCardCategoryWidget), findsOneWidget);
    expect(find.byIcon(Icons.family_restroom), findsOneWidget);
    expect(find.text('Família'), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.text('5 tarefas'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
}
