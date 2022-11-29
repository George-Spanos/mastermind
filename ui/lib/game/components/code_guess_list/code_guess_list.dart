import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/components/code_guess/code_guess.dart';
import 'package:mastermind_ui/game/game/bloc/game_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_state.dart';

class CodeGuessList extends StatelessWidget {
  const CodeGuessList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameNotPlaying) {
          return const Text("Press play to start playing!");
        }
        if (state is GamePlaying) {
          return ListView.separated(
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: state.guessIndex == index + 1
                          ? const Color.fromARGB(244, 223, 223, 223)
                          : Colors.transparent),
                  child: Row(children: [
                    Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    CodeGuess(
                      guess: state.guesses[index],
                      guessIndex: index,
                    )
                  ]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                    height: 15,
                  ),
              itemCount: state.totalGuesses);
        }
        if (state is GameFinished) {
          return Text(state.message);
        }
        return const Text("Unknown state");
      },
    );
  }
}
