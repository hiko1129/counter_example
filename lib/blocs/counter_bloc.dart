import 'dart:async';

import 'package:counter_app/blocs/bloc.dart';
import 'package:counter_app/models/number_counter.dart';

class CounterBloc implements Bloc {
  final _counter = NumberCounter(value: 0);

  CounterBloc() {
    _counterStreamController.sink.add(_counter);
  }

  final StreamController<NumberCounter> _counterStreamController =
      StreamController<NumberCounter>();

  Stream<NumberCounter> get count => _counterStreamController.stream;

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
