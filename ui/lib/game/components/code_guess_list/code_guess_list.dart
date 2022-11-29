import 'package:flutter/widgets.dart';
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
        if (state is NotPlaying) return const Text("not started playing");
        if (state is Playing) {
          return ListView.separated(
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(children: [
                  Text(
                    (index + 1).toString(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  CodeGuess(guess: state.guesses[index])
                ]);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                    height: 15,
                  ),
              itemCount: state.totalGuesses);
        }
        return const Text("Unknown state");
      },
    );
  }
}
