import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/provider_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/counter_bloc.dart';
import '../provider/counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'Home Page');
      }
    ),
    GoRoute(
      path: '/provider_page',
      builder: (BuildContext context, GoRouterState state) {
        return const MyProviderPage(title: 'Provider Page');
      }
    ),
    GoRoute(
      path: '/bloc_page',
      builder: (BuildContext context, GoRouterState state) {
        // Provide the BLoC only to the route that requires it
        return BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
          child: const MyBlocPage(title: 'Bloc Page'),
        );
      },
    ),
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Home Page',
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
        title: const Text('Home Page'), // Uses the title passed to MyHomePage
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
              onTap: () => context.go('/provider_page')
            ),
            ListTile(
              title: const Text('bloc screen'),
              onTap: () => context.go('/bloc_page')
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

