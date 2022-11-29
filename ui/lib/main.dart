import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mastermind_ui/app_initializer.dart';
import 'package:mastermind_ui/game/game/game.dart';

void main() async {
  await dotenv.load(fileName: kDebugMode ? ".env" : "release.env");

  runApp(AppInitializer(child: const MastermindApp()));
}

class MastermindApp extends StatelessWidget {
  const MastermindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Mastermind")), body: const Game()),
    );
  }
}
