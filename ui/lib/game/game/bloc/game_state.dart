import 'package:equatable/equatable.dart';
import 'package:mastermind_ui/game/models.dart';

abstract class GameState extends Equatable {
  const GameState();
}

/// State representing that no game is initialized.
class GameNotPlaying extends GameState {
  @override
  List<Object?> get props => [];
}

class GamePlaying extends GameState {
  final String codeId;
  final int guessIndex;
  final int totalGuesses;
  final List<Guess> guesses;
  const GamePlaying(
      {required this.codeId,
      required this.guessIndex,
      required this.totalGuesses,
      this.guesses = const []});
  GamePlaying addGuess(int correctSpots, int incorrectSpots) {
    final newGuessIndex = guessIndex + 1;
    final newGuesses = [...guesses];
    newGuesses[guessIndex] = newGuesses[guessIndex]
        .addFeedback(GuessFeedback(correctSpots, incorrectSpots));
    return GamePlaying(
        codeId: codeId,
        guessIndex: newGuessIndex,
        totalGuesses: totalGuesses,
        guesses: newGuesses);
  }

  @override
  List<Object?> get props => [codeId, guessIndex, totalGuesses];
}

class GameFinished extends GameState {
  final GameStatus gameStatus;
  late final String message;

  GameFinished(this.gameStatus, List<int>? code) {
    if (gameStatus == GameStatus.won) {
      message = "Congratulation you won!";
    }
    if (gameStatus == GameStatus.lost) {
      message = "Sorry you lost. Correct code is $code";
    }
  }

  @override
  List<Object?> get props => [gameStatus, message];
}
