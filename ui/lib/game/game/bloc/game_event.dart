abstract class GameEvent {
  const GameEvent();
}

class GameStarted extends GameEvent {
  final int totalGuesses;
  const GameStarted({required this.totalGuesses});
}

class GuessChanged extends GameEvent {
  final int color;
  final int guessIndex;
  final int pegIndex;

  const GuessChanged(this.color, this.guessIndex, this.pegIndex);
}

class GuessSubmitted extends GameEvent {
  const GuessSubmitted();
}
