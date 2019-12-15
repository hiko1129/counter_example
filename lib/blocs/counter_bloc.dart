import 'dart:async';

import 'package:counter_app/blocs/bloc.dart';
import 'package:counter_app/models/counter.dart';

class CounterBloc implements Bloc {
  CounterBloc() {
    _counterStreamController.sink.add(_counter);
  }

  final _counter = Counter(value: 0);

  final StreamController<Counter> _counterStreamController =
      StreamController<Counter>();

  Stream<Counter> get count => _counterStreamController.stream;

  void increment() {
    _counter.increment();
    _counterStreamController.sink.add(_counter);
  }

  void decrement() {
    _counter.decrement();
    _counterStreamController.sink.add(_counter);
  }

  @override
  void dispose() {
    _counterStreamController.close();
  }
}
