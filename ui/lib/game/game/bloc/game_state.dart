import 'package:equatable/equatable.dart';
import 'package:mastermind_ui/game/models.dart';

abstract class GameState extends Equatable {
  const GameState();
}

/// State representing that no game is initialized.
class NotPlaying extends GameState {
  @override
  List<Object?> get props => [];
}

class Playing extends GameState {
  final String codeId;
  final int guessIndex;
  final int totalGuesses;
  final List<Guess> guesses;
  const Playing(
      {required this.codeId,
      required this.guessIndex,
      required this.totalGuesses,
      this.guesses = const []});
  @override
  List<Object?> get props => [codeId, guessIndex, totalGuesses];
}
