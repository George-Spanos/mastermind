import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/components/code_guess_list/code_guess_list.dart';
import 'package:mastermind_ui/game/game/bloc/game_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_event.dart';
import 'package:mastermind_ui/game/game/bloc/game_state.dart';

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
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 340,
        ),
        child: Column(children: [
          const Flexible(child: CodeGuessList()),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: _startPlaying,
              child: BlocBuilder<GameBloc, GameState>(
                  builder: (context, state) => state is Playing
                      ? const Text("Submit Guess")
                      : const Text("Play"))),
          const SizedBox(
            height: 15,
          )
        ]),
      ),
    );
  }

  _startPlaying() {
    context.read<GameBloc>().add(const GameStarted(totalGuesses: 12));
  }
}
