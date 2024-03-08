// A page that interacts with CounterBloc to display and update the counter.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/random/random_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class MyBlocPage extends StatelessWidget {
  const MyBlocPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // Listens for state changes in CounterBloc to show a SnackBar.
    return BlocListener<CounterBloc, CounterState>(
      listenWhen: (previousState, currentState) =>
          currentState.counter % 3 == 0,
      listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('This is your ${state.counter} press'))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Page'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: Text('Burger Menu'),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () => context.go('/'),
              ),
              ListTile(
                title: const Text('provider screen'),
                onTap: () => context.go('/provider_page'),
              ),
              ListTile(
                title: const Text('bloc screen'),
                onTap: () => context.go('/bloc_page'),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Normal Counter:',
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(IncrementCounterEvent());
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(DecrementCounterEvent());
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Random Counter:',
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.randomNumber}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(RandomNumberStateIncrement());
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add((RandomNumberStateDecrement()));
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(GenerateRandomNumberState());
                    },
                    tooltip: 'Random',
                    child: const Icon(Icons.shuffle),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
