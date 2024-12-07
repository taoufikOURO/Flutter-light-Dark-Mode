import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statepro/themeNotifier.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeNotifier(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: value.lightTheme,
        darkTheme: value.darkTheme,
        themeMode: value.themeMode,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dark et light mode avec flutter!'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeNotifier.toggleThemeMode();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
