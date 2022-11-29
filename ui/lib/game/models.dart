import 'package:equatable/equatable.dart';

class EvaluateGuessDto {
  final String uuid;
  final List<int> guess;
  EvaluateGuessDto(this.guess, this.uuid);
  Map<String, dynamic> toJson() => {'uuid': uuid, 'guess': guess};
}

enum GameStatus { lost, won, playing, unknown }

class StartGameResponse {
  final String gameId;
  StartGameResponse.success(Map<String, dynamic> json)
      : gameId = json['gameId'];
  StartGameResponse.failed() : gameId = '';
}

class EvaluateGuessResponse {
  final int correctSpots;
  final int incorrectSpots;
  final GameStatus gameStatus;
  EvaluateGuessResponse.success(Map<String, dynamic> json)
      : correctSpots = json['correctSpots'],
        incorrectSpots = json['incorrectSpots'],
        gameStatus = json['gameStatus'];
  EvaluateGuessResponse.failed()
      : correctSpots = 0,
        incorrectSpots = 0,
        gameStatus = GameStatus.lost;
}

class GuessFeedback extends Equatable {
  final int blackSpots;
  final int whiteSpots;

  const GuessFeedback(this.blackSpots, this.whiteSpots);

  @override
  List<Object?> get props => [blackSpots, whiteSpots];
}

class Guess extends Equatable {
  final List<int> code;
  final GuessFeedback? feedback;

  const Guess(this.code, this.feedback);
  Guess.empty()
      : code = List.filled(4, 0),
        feedback = null;
  @override
  List<Object?> get props => [code, feedback];
}
