import 'package:meta/meta.dart';

class Counter {
  Counter({@required int value}) : _value = value;

  int _value;

  void increment() {
    _value += 1;
  }

  void decrement() {
    _value -= 1;
  }

  int get value => _value;
}
