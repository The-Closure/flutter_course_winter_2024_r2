import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/bloc/counter_bloc.dart';
import 'package:intro_to_bloc/bloc/counter_event.dart';
import 'package:intro_to_bloc/bloc/counter_state.dart';
import 'package:intro_to_bloc/config/log/bloc_observe.dart';
import 'package:intro_to_bloc/lamp/lamp_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LampPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(RestoreToZero());
                  },
                  icon: Icon(Icons.exposure_zero))
            ],
            leading: IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Decreament());
                },
                icon: Icon(Icons.minimize)),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is TheNumberHasIncreamented) {
                      return Text(
                        state.counter.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else if (state is TheNumberHasDecreamented) {
                      return Text(
                        state.counter.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return Text("0");
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increament());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }),
    );
  }
}
