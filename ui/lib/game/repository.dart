import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

import 'models.dart';

class ApiClient {
  final _apiUrl = dotenv.env['API_URL'];
  Future<StartGameResponse> startGame() async {
    try {
      final response = await http.post(Uri.parse('$_apiUrl/startGame'));
      return StartGameResponse.success(json.decode(response.body));
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      throw Exception(exception);
    }
  }

  Future<EvaluateGuessResponse> evaluateGuess(EvaluateGuessDto dto) async {
    try {
      final response = await http.post(Uri.parse('$_apiUrl/evaluateGuess'),
          body: json.encode(dto.toJson()));
      if (response.statusCode == 200) {
        return EvaluateGuessResponse.success(json.decode(response.body));
      } else {
        throw Exception(
          "Invalid http status $response.statusCode",
        );
      }
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      throw Exception(exception);
    }
  }
}
