import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind_ui/auth/auth_repository.dart';
import 'package:mastermind_ui/game/game/bloc/game_bloc.dart';
import 'package:mastermind_ui/game/repository.dart';

class AppInitializer extends StatelessWidget {
  final ApiClient _api = ApiClient();
  final AuthRepository _authRepository = AuthRepository();
  final Widget child;
  AppInitializer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(value: _authRepository),
        RepositoryProvider<ApiClient>.value(value: _api),
      ],
      child: BlocProvider(
        create: (context) => GameBloc(_api),
        child: child,
      ),
    );
  }
}
