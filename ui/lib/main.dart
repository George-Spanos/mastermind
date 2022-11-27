import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mastermind_ui/game/game/game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/repository.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ApiClient(),
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Mastermind")),
            body: const Game()),
      ),
    );
  }
}
