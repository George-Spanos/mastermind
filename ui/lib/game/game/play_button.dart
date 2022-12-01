import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/constants.dart';
import 'package:mastermind_ui/game/game/bloc/game_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_state.dart';

import 'bloc/game_event.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
        builder: (context, state) => ElevatedButton(
            onPressed: _playEnabled(state) ? _play(context) : null,
            child: state is GamePlaying
                ? const Text("Submit Guess")
                : const Text("Play")));
  }

  VoidCallback _play(BuildContext context) {
    return () {
      final bloc = context.read<GameBloc>();
      final state = bloc.state;
      if (state is GameNotPlaying || state is GameFinished) {
        bloc.add(const GameStarted(totalGuesses: totalGuesses));
      } else if (state is GamePlaying) {
        bloc.add(const GuessSubmitted());
      }
    };
  }

  bool _playEnabled(GameState state) =>
      state is GameNotPlaying ||
      state is GameFinished ||
      state is GamePlaying &&
          state.lastGuessIsValid() &&
          !state.loadingFeedback;
}
