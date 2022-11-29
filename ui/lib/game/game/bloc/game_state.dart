import 'package:mastermind_ui/game/models.dart';

abstract class GameState {
  const GameState();
}

/// State representing that no game is initialized.
class GameNotPlaying extends GameState {}

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
  GamePlaying addFeedbackToLastGuess(int correctSpots, int incorrectSpots) {
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

  GamePlaying changeGuess(int color, int guessIndex, int pegIndex) {
    final newGuesses = [...guesses];
    newGuesses[guessIndex].code[pegIndex] = color;
    return GamePlaying(
        codeId: codeId,
        guessIndex: this.guessIndex,
        totalGuesses: totalGuesses,
        guesses: newGuesses);
  }
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
}
