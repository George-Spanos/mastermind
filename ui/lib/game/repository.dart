import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class ApiClient {
  final _apiUrl = dotenv.env['API_URL'];
  Future<StartGameResponse> startGame() async {
    final response = await http.post(Uri.parse('$_apiUrl/startGame'));
    return StartGameResponse.success(json.decode(response.body));
  }

  Future<EvaluateGuessResponse> evaluateGuess(EvaluateGuessDto dto) async {
    final response = await http.post(Uri.parse('$_apiUrl/evaluateGuess'),
        body: dto.toJson());
    return EvaluateGuessResponse.success(json.decode(response.body));
  }
}
