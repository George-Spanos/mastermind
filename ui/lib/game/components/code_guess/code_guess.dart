import 'package:flutter/material.dart';
import 'package:mastermind_ui/constants.dart';
import 'package:mastermind_ui/game/components/code_peg/code_peg.dart';

import '../../models.dart';
import '../guess_feedback/guess_feedback.dart';

class CodeGuess extends StatelessWidget {
  final Guess guess;
  const CodeGuess({super.key, required this.guess});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 80,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                final guessIndex = guess.code.elementAt(index);
                final color = pegColors[guessIndex]!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CodePeg(
                    color: color,
                  ),
                );
              }),
              itemCount: guess.code.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          if (guess.feedback != null) ...[
            GuessFeedbackComponent(feedback: guess.feedback!)
          ]
        ],
      ),
    );
  }
}
