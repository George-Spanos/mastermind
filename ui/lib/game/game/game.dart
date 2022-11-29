import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/components/code_guess_list/code_guess_list.dart';
import 'package:mastermind_ui/game/components/color_list/color_list.dart';
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 340,
            child: Column(children: [
              const Flexible(fit: FlexFit.tight, child: CodeGuessList()),
              ColorList(),
              ElevatedButton(
                  onPressed: _startPlaying,
                  child: BlocBuilder<GameBloc, GameState>(
                      builder: (context, state) => state is GamePlaying
                          ? const Text("Submit Guess")
                          : const Text("Play"))),
            ]),
          ),
        ],
      ),
    );
  }

  _startPlaying() {
    final bloc = context.read<GameBloc>();
    final state = bloc.state;
    if (state is GameNotPlaying) {
      bloc.add(const GameStarted(totalGuesses: 12));
    } else if (state is GamePlaying) {
      throw UnimplementedError();
      // bloc.add(GuessSubmitted(guess: guess, codeId: codeId));
    }
  }
}
