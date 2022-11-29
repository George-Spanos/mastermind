import 'package:equatable/equatable.dart';

import '../../models.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class GameStarted extends GameEvent {
  final int totalGuesses;
  const GameStarted({required this.totalGuesses});

  @override
  List<Object?> get props => [totalGuesses];
}

class GuessChanged extends GameEvent {
  final int color;
  final int guessIndex;
  final int pegIndex;

  const GuessChanged(this.color, this.guessIndex, this.pegIndex);

  @override
  List<Object?> get props => [color, guessIndex, pegIndex];
}

class GuessSubmitted extends GameEvent {
  const GuessSubmitted();
  @override
  List<Object> get props => [];
}
