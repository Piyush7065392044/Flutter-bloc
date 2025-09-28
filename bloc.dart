import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1️⃣ Counter Cubit
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

// 2️⃣ Main App
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Counter',
        home: CounterPage(),
      ),
    );
  }
}

// 3️⃣ Counter Page
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, count) {
            return Text(
              '$count',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: () => counterCubit.decrement(),
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              heroTag: 'increment',
              onPressed: () => counterCubit.increment(),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
