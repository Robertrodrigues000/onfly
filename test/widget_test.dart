import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onfly/presenter/pages/home/home_page.dart';

void main() {
  testWidgets('Heart smoke test', (WidgetTester tester) async {
    // pumpWidget() renderiza a UI dado um widget.
    await tester.pumpWidget(HomePage());
    // Finder utilizado para garantir que um elemento do tipo Icon foi renderizado.
    final Finder iconFinder = find.byType(Icon);
    // Aqui utilizamos nosso Finder junto ao nosso Matcher para garantirmos que temos apenas um Icon sendo renderizado.
    expect(iconFinder, findsOneWidget);
    // Como necessito do Widget, reaproveito nosso Finder junto ao WidgetTester para ter acesso ao Widget e suas propriedades.
    final Icon icon = tester.widget(iconFinder);
    // Verificando a verificação da cor do meu Widget.
    expect(icon.color, Colors.pink[200]);
    // Verificando o size do Icon.
    expect(icon.size, 32.0);
    // Verificando o ícone que foi renderizado.
    expect(icon.icon, Icons.favorite_border);
    // Para realizarmos o click, primeiro precisamos encontrar o Widget responsável por isto.
    final gestureFinder = find.byType(GestureDetector);
    // Tendo o Widget de Gesture encontrado, podemos simular o click também utilizando o WidgetTester.
    await tester.tap(gestureFinder);
    // pumpAndSettle() é semelhante ao uso do pump(), porém aqui temos a necessidade que todos os quadros necessários sejam renderizados devido a nossa animação.
    await tester.pumpAndSettle();
    // Finalizado toda a nossa animação, precisamos encontrar novamente o nosso ícone.
    final Icon iconAfter = tester.widget(iconFinder);
    // Agora verificarmos se o seu valor de size foi alterado após a animação.
    expect(iconAfter.size, 58.0);
    // Também verificamos a cor e o icon para garantirmos o que era esperado.
    expect(iconAfter.color, Colors.pink);
    expect(iconAfter.icon, Icons.favorite);
  });
}
