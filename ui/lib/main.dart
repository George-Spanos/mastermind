import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mastermind_ui/app_initializer.dart';
import 'package:mastermind_ui/game/game/game.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: getEnvFilename());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    runApp(AppInitializer(child: const MastermindApp()));
  } else {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://0b64b5d9d6e94ad6bfa393e106df06bd@o4504247220502528.ingest.sentry.io/4504247221616640';
      },
      appRunner: () => runApp(AppInitializer(child: const MastermindApp())),
    );
  }
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
