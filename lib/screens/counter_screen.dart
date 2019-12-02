import 'package:counter_app/blocs/counter_bloc.dart';
import 'package:counter_app/models/number_counter.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CounterScreen extends StatelessWidget {
  final CounterBloc _counterBloc;

  CounterScreen({@required CounterBloc counterBloc})
      : _counterBloc = counterBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _counterBloc.count,
      builder: (BuildContext context, AsyncSnapshot<NumberCounter> snapshot) {
        // FIXME(hiko1129): おそらく本当はBehaviorSubjectのseededで初期値使ってnullにならないようにしたよい
        if (!snapshot.hasData) return Container();

        final count = snapshot.data.value;
        return Scaffold(
          appBar: AppBar(
            title: Text("CounterScreen"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$count',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  _counterBloc.increment();
                },
                child: Icon(Icons.add),
              ),
              SizedBox(height: 8),
              FloatingActionButton(
                onPressed: () {
                  _counterBloc.decrement();
                },
                child: Icon(Icons.remove),
              )
            ],
          ),
        );
      },
    );
  }
}
