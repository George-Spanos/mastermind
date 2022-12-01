import 'package:mastermind_ui/constants.dart';
import 'package:mastermind_ui/game/models.dart';

abstract class GameState {
  const GameState();
}

/// State representing that no game is initialized.
class GameNotPlaying extends GameState {}

class GamePlaying extends GameState {
  final bool loadingFeedback;
  final String codeId;
  final int guessIndex;
  final int totalGuesses;
  final List<Guess> guesses;
  const GamePlaying(
      {required this.codeId,
      required this.guessIndex,
      required this.totalGuesses,
      this.loadingFeedback = false,
      this.guesses = const []});
  GamePlaying addFeedbackToLastGuess(int correctSpots, int incorrectSpots) {
    final newGuesses = [...guesses];
    newGuesses[guessIndex - 1] = newGuesses[guessIndex - 1]
        .addFeedback(GuessFeedback(correctSpots, incorrectSpots));

    return GamePlaying(
        codeId: codeId,
        guessIndex: guessIndex + 1,
        totalGuesses: totalGuesses,
        guesses: newGuesses,
        loadingFeedback: false);
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

  GamePlaying setLoading(bool loading) {
    return GamePlaying(
        codeId: codeId,
        guessIndex: guessIndex,
        totalGuesses: totalGuesses,
        guesses: guesses,
        loadingFeedback: loading);
  }

  bool lastGuessIsValid() {
    return guesses[guessIndex - 1].code.every((element) => element != 0);
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
      final colorCode = code?.map((e) => pegColorNames[e]).toList();
      message = "Sorry you lost. Correct code is $colorCode";
    }
  }
}
