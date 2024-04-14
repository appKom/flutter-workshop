import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workshop/layout/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppCum Kurs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AppCum Kurs'),
      // home: const Layout(),
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
  double sessaSize = 400.0;
  bool isSessaBig = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 48,
              ),
              const Text(
                'Velkommen til kurs i flutter',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(height: sessaSize, child: Image.asset('assets/images/sessa.jpg')),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Klarer du å navigere deg til homepage?",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  if (isSessaBig) {
                    setState(() {
                      sessaSize = 200;
                      isSessaBig = false;
                    });
                  } else {
                    setState(() {
                      sessaSize = 400;
                      isSessaBig = true;
                    });
                  }
                },
                child: (isSessaBig) ? Text('Gjør Sessa liten') : Text('Gjør Sessa stor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
