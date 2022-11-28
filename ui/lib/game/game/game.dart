import 'package:flutter/material.dart';
import 'package:mastermind_ui/game/components/code/code.dart';

import '../models.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game> {
  final GameStatus gameStatus = GameStatus.unknown;
  final int guessIndex = 1;
  @override
  Widget build(BuildContext context) {
    return const Code();
  }
}
