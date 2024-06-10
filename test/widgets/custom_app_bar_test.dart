import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskieapp/presentation/comuns/constants/images.dart';
import 'package:taskieapp/presentation/widgets/custom_appbar.dart';

void main() {
  testWidgets("Teste de renderização do custom app bar",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomAppBarWidget(
            nomeUsuario: 'Emerson',
          ),
        ),
      ),
    );

    expect(find.byType(CustomAppBarWidget), findsOneWidget);
    expect(find.text("10"), findsOneWidget);
    expect(find.text('2024'), findsOneWidget);
    expect(find.text('Junho'), findsOneWidget);
    expect(find.text('Olá, Emerson!'), findsOneWidget);

    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName == ImagesPath.avatarPlaceholder),
        findsOneWidget);
  });
}
