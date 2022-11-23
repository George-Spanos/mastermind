import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("My first app")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ElevatedButton(onPressed: null, child: Text("My answer")),
              ElevatedButton(onPressed: null, child: Text("My answer")),
              ElevatedButton(onPressed: null, child: Text("My answer"))
            ],
          ),
        ),
      ),
    );
  }
}
