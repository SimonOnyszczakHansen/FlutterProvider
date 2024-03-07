import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/counter_provider.dart'; // Import the CounterProvider
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/provider_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // Wraps the application in a ChangeNotifierProvider
      create: (context) => CounterProvider(), // Creates an instance of CounterProvider
      child: const MyApp(), // The root widget of the application
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'Flutter Demo');
      }
    ),
    GoRoute(
      path: '/provider_page',
      builder: (BuildContext context, GoRouterState state) {
        return const MyProviderPage(title: 'Provider Page');
      }
      ),
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
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
    // Simpler UI with just a "Welcome" message
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // Uses the title passed to MyHomePage
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
              title: const Text('provider screen'),
              onTap: () => context.go('/provider_page')
            ),
            ListTile(
              title: const Text('bloc screen'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome To My Application',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
