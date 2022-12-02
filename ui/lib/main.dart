import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mastermind_ui/app_initializer.dart';
import 'package:mastermind_ui/game/game/game.dart';

void main() async {
  await dotenv.load(fileName: getEnvFilename());
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(AppInitializer(child: const MastermindApp()));
}

class MastermindApp extends StatelessWidget {
  const MastermindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Mastermind")), body: const Game()),
    );
  }
}

String getEnvFilename() {
  if (kIsWeb) {
    return kDebugMode ? ".env" : "release.env";
  } else {
    if (Platform.isAndroid) return "release.env";
  }
  return ".env";
}
