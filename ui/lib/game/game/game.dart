import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/components/code_guess_list/code_guess_list.dart';
import 'package:mastermind_ui/game/components/color_list/color_list.dart';
import 'package:mastermind_ui/game/game/bloc/game_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_event.dart';
import 'package:mastermind_ui/game/game/bloc/game_state.dart';
import 'package:mastermind_ui/game/game/play_button.dart';

import '../../constants.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 340,
            child: Column(children: const [
              Flexible(fit: FlexFit.tight, child: CodeGuessList()),
              ColorList(),
              PlayButton(),
              SizedBox(
                height: 15,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
