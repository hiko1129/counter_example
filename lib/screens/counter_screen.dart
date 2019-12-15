import 'package:counter_app/blocs/counter_bloc.dart';
import 'package:counter_app/models/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CounterBloc>(context, listen: false).increment();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CounterBloc>(context);

    return StreamBuilder<Counter>(
      stream: bloc.count,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          if (!snapshot.hasData) {
            const Text('問題が発生しました。もう一度お試しください。');
          }
        }

        if (!snapshot.hasData) {
          const Text('データがありません');
        }

        final count = snapshot.data.value;

        return Scaffold(
          appBar: AppBar(
            title: const Text("CounterScreen"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
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
                onPressed: bloc.increment,
                child: Icon(Icons.add),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                onPressed: bloc.decrement,
                child: Icon(Icons.remove),
              )
            ],
          ),
        );
      },
    );
  }
}
