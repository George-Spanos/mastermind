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

class GameFinished extends GameEvent {
  final GameStatus gameStatus;
  const GameFinished({required this.gameStatus});

  @override
  List<Object?> get props => [gameStatus];
}

class GuessSubmitted extends GameEvent {
  final Guess guess;
  const GuessSubmitted({required this.guess});
  @override
  List<Object> get props => [guess];
}
