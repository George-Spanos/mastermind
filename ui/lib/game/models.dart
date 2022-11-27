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
