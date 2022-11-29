import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/game/game/bloc/game_state.dart';
import 'package:mastermind_ui/game/models.dart';
import 'package:mastermind_ui/game/repository.dart';

import 'game_event.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final ApiClient _api;
  GameBloc(this._api) : super(NotPlaying()) {
    on<GameEvent>(_handleGameEvent);
  }
  void _handleGameEvent(GameEvent event, Emitter<GameState> emit) async {
    if (event is GameStarted) {
      final response = await _api.startGame();
      emit(Playing(
          codeId: response.gameId,
          guessIndex: 1,
          totalGuesses: event.totalGuesses,
          guesses: List.filled(event.totalGuesses, Guess.empty())));
    }
  }
}
