import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.lightGreen),
      onGenerateRoute: (settings) {
        if (settings.name == '/page1')
          return MaterialPageRoute(
            builder: (context) {
              return Page1();
            },
            settings: RouteSettings(name: '/page1'),
          );

        if (settings.name == '/page2')
          return MaterialPageRoute(
            builder: (context) {
              return Page2();
            },
            settings: RouteSettings(name: '/page2'),
          );
      },
      initialRoute: '/page1',
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const Text('Page1'),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).pushNamed('/page2'),
                child: Text('Go to page 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const Text('Page2'),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).pushNamed('/page1'),
                child: Text('Go to page 1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
