import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/counter_provider.dart'; // Import the CounterProvider
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // Wraps the application in a ChangeNotifierProvider
      create: (context) => CounterProvider(), // Creates an instance of CounterProvider
      child: const MyApp(), // The root widget of the application
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyProviderPage(title: 'Provider Page'), // The home page of the app
    );
  }
}

class MyProviderPage extends StatefulWidget {
  const MyProviderPage({super.key, required this.title});

  final String title;

  @override
  State<MyProviderPage> createState() => _MyProviderPageState();
}

class _MyProviderPageState extends State<MyProviderPage> {
  @override
  Widget build(BuildContext context) {
    // Uses Provider to get the current instance of CounterProvider
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Provider Page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple
                ),
              child: Text('Burger Menu'),
            ),
            ListTile(
              title: const Text('provider screen'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('bloc screen'),
              onTap: () {},
            )
          ],
        )
      ),
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
                      counterProvider.incrementCounter(); // Increments the counter
                      // Shows a SnackBar every 3 presses
                      if (counterProvider.counter % 3 == 0) {
                        final snackBar = SnackBar(
                          content: Text('This is the ${counterProvider.counter} press'),
                          duration: const Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add)),
                const SizedBox(width: 30),
                FloatingActionButton(
                  onPressed: counterProvider.decrementCounter, // Decrements the counter
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