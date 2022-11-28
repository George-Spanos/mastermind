import 'package:flutter/material.dart';
import 'package:mastermind_ui/game/components/code_feedback/code_feedback.dart';
import 'package:mastermind_ui/game/components/code_peg/code_peg.dart';

class Code extends StatelessWidget {
  const Code({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints.expand(height: 100, width: 250),
            height: 100,
            child: ListView.builder(
              itemBuilder: ((context, index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CodePeg(
                      color: Colors.greenAccent,
                    ),
                  )),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        const Flexible(
          child: CodeFeedback(
            blackPegs: 3,
            whitePegs: 1,
          ),
        )
      ],
    );
  }
}
