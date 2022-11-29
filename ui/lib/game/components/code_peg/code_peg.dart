import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_event.dart';
import 'package:mastermind_ui/game/game/bloc/game_state.dart';

class CodePeg extends StatelessWidget {
  final Color color;
  final int guessIndex;
  final int pegIndex;
  const CodePeg(
      {super.key,
      required this.color,
      required this.guessIndex,
      required this.pegIndex});
  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: Colors.brown.shade800, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.shade300,
                blurRadius: 3,
                blurStyle: BlurStyle.outer,
              )
            ]),
      ),
      onAccept: (color) {
        final bloc = context.read<GameBloc>();
        final state = bloc.state;
        if (state is GamePlaying && state.guessIndex == guessIndex + 1) {
          bloc.add(GuessChanged(color, guessIndex, pegIndex));
        }
      },
    );
  }
}
