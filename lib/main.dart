import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart';
import 'core/presentation/theme/app_theme.dart';
import 'core/presentation/router/app_router.dart';
import 'features/breathing/presentation/bloc/breathing_bloc.dart';
import 'features/breathing/presentation/bloc/breathing_event.dart';
import 'features/breathing/presentation/bloc/breathing_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<BreathingBloc>()..add(const BreathingEvent.started()),
      child: BlocBuilder<BreathingBloc, BreathingState>(
        buildWhen: (previous, current) =>
            previous.isDarkMode != current.isDarkMode,
        builder: (context, state) {
          return MaterialApp.router(
            title: 'NewU Breathing',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
