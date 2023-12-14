import 'package:flutter_demo/counter_bloc.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc Tests', () {
    test('CounterBloc increments correctly', () {
      // Arrange
      final bloc = CounterBloc();
      final expectedValues = [ 1, 2, 3, 4];

      // Act and Assert
      expectLater(bloc.counterStream, emitsInOrder(expectedValues));

      bloc.incrementCounter();
      bloc.incrementCounter();
      bloc.incrementCounter();
      bloc.incrementCounter();
      bloc.incrementCounter();

      // Clean up
      bloc.dispose();
    });

    // Add more CounterBloc tests as needed
  });

  group('MyHomePage Widget Tests', () {
    testWidgets('MyHomePage has three list views', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(MyApp());

      // Act and Assert
      expect(find.byType(VerticalListView), findsNWidgets(2));
      expect(find.byType(HorizontalListView), findsOneWidget);
    });

    // Add more MyHomePage widget tests as needed
  });
}
