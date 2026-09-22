import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_movil_navegacion/main.dart';

void main() {
  testWidgets('recorre Login, Cuenta y Mis pedidos sin vaciar la pila', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(474, 1020));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const MercadoApp());

    await tester.tap(find.text('Iniciar sesión'));
    await tester.pumpAndSettle();
    expect(find.text('Camila Restrepo'), findsOneWidget);

    await tester.tap(find.text('Mis pedidos').first);
    await tester.pumpAndSettle();
    expect(find.text('Pedidos de Camila Restrepo'), findsOneWidget);

    await tester.tap(find.text('Volver a mi cuenta'));
    await tester.pumpAndSettle();
    expect(find.text('Camila Restrepo'), findsOneWidget);

    await tester.ensureVisible(find.text('Cerrar sesión'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cerrar sesión'));
    await tester.pumpAndSettle();
    expect(find.text('Bienvenido de vuelta'), findsOneWidget);
  });
}
