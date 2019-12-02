import 'package:meta/meta.dart';

class NumberCounter {
  int _value;

  NumberCounter({@required int value}) : _value = value;

  void increment() {
    _value += 1;
  }

  void decrement() {
    _value -= 1;
  }

  int get value => _value;
}
