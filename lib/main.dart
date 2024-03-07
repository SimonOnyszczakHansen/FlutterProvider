import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/providers/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // Wraps the application in a ChangeNotifierProvider
      create: (context) =>
          CounterProvider(), // Creates an instance of CounterProvider
      child: const MyApp(), // The root widget of the application
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    // Uses Provider to get the current instance of CounterProvider
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Burger menu",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text(
              "provider screen",
              style: TextStyle(color: Colors.blue),
              ),
            onTap: () {}),
          ListTile(
            title: const Text(
              "bloc screen",
              style: TextStyle(color: Colors.blue),
              ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              "stream screen",
              style: TextStyle(color: Colors.blue),
              ),
            onTap: () {},
          )
        ],
      )),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Flutter Providers")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterProvider.counter}', // Displays the counter value from CounterProvider
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      counterProvider.incrementCounter();
                      // Shows a SnackBar every 3 presses
                      if (counterProvider.counter % 3 == 0) {
                        final snackBar = SnackBar(
                          content: Text(
                              'This is the ${counterProvider.counter} press'),
                          duration: const Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add)),
                const SizedBox(width: 50),
                FloatingActionButton(
                  onPressed: counterProvider.decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
