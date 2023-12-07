import 'package:counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    final counter =
        counterCubit.state; //countercubit calss reference and get state
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit,int>(
              bloc: counterCubit,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          counterCubit.increment();
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
