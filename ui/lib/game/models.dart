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
  final List<int>? secretCode;
  EvaluateGuessResponse.success(Map<String, dynamic> json)
      : correctSpots = json['correctSpots'],
        incorrectSpots = json['incorrectSpots'],
        gameStatus = json['gameStatus'],
        secretCode = json['secretCode'];
  EvaluateGuessResponse.failed()
      : correctSpots = 0,
        incorrectSpots = 0,
        gameStatus = GameStatus.lost,
        secretCode = const [];
  bool gameIsFinished() {
    return gameStatus == GameStatus.won || gameStatus == GameStatus.lost;
  }
}

class GuessFeedback extends Equatable {
  final int blackSpots;
  final int whiteSpots;

  const GuessFeedback(this.blackSpots, this.whiteSpots);

  @override
  List<Object?> get props => [blackSpots, whiteSpots];
}

class Guess {
  final List<int> code;
  final GuessFeedback? feedback;

  const Guess(this.code, this.feedback);
  Guess.empty()
      : code = List.filled(4, 0, growable: false),
        feedback = null;
  Guess addFeedback(GuessFeedback feedback) {
    return Guess(code, feedback);
  }
}
