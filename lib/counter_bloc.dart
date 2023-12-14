import 'dart:async';

class CounterBloc {
  final _controller = StreamController<int>.broadcast();
  int _counter = 0;

  Stream<int> get counterStream => _controller.stream;

  void incrementCounter() {
    _counter++;
    _controller.sink.add(_counter);
  }

  void dispose() {
    _controller.close();
  }
}

final counterBloc = CounterBloc();
