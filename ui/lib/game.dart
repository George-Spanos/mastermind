import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/repository.dart';

import 'models.dart';

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
    final apiClient = context.read<ApiClient>();
    return FutureBuilder(
        future: apiClient.startGame(),
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            return Text(snapshot.data!.gameId);
          } else {
            if (snapshot.hasError) return const Text("failed to get");
            return const Text("loading");
          }
        });
  }
}
