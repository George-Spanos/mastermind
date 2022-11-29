import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_state.dart';
import 'package:mastermind_ui/game/models.dart';
import 'package:mastermind_ui/game/repository.dart';

import 'game_event.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final ApiClient _api;
  GameBloc(this._api) : super(GameNotPlaying()) {
    on<GameEvent>(_handleGameEvent);
  }
  Future<void> _handleGameEvent(
      GameEvent event, Emitter<GameState> emit) async {
    if (event is GameStarted) {
      final response = await _api.startGame();
      emit(GamePlaying(
          codeId: response.gameId,
          guessIndex: 1,
          totalGuesses: event.totalGuesses,
          guesses: List.filled(event.totalGuesses, Guess.empty())));
    } else if (event is GuessSubmitted) {
      final response = await _api
          .evaluateGuess(EvaluateGuessDto(event.guess.code, event.codeId));
      if (response.gameIsFinished()) {
        emit(GameFinished(response.gameStatus, response.secretCode));
      } else {
        assert(state is GamePlaying);
        final playingState = state as GamePlaying;
        emit(playingState.addGuess(
            response.correctSpots, response.incorrectSpots));
      }
    }
  }
}
