import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/presentation/widgets/responsive_layout.dart';
import '../../../../injection.dart';
import '../bloc/breathing_bloc.dart';
import '../bloc/breathing_event.dart';
import '../bloc/breathing_state.dart';
import '../widgets/setup_view.dart';
import '../widgets/exercise_view.dart';
import '../widgets/finish_view.dart';

class BreathingPage extends StatelessWidget {
  const BreathingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<BreathingBloc>()..add(const BreathingEvent.started()),
      child: const ResponsiveLayout(
        mobile: _BreathingView(),
        desktop: CenteredMobileLayout(child: _BreathingView()),
      ),
    );
  }
}

class _BreathingView extends StatelessWidget {
  const _BreathingView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreathingBloc, BreathingState>(
      builder: (context, state) {
        final isDark = state.isDarkMode;
        final bgAsset = isDark
            ? 'assets/dark_mode_bg.svg'
            : 'assets/light_background.svg';

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Background
              SvgPicture.asset(bgAsset, fit: BoxFit.cover),
              // Content
              SafeArea(child: _buildContent(state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(BreathingState state) {
    switch (state.phase) {
      case BreathingPhase.setup:
        return const SetupView();
      case BreathingPhase.ready:
      case BreathingPhase.inhale:
      case BreathingPhase.holdIn:
      case BreathingPhase.exhale:
      case BreathingPhase.holdOut:
        return const ExerciseView();
      case BreathingPhase.finished:
        return const FinishView();
    }
  }
}
