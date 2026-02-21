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

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Solid Background Color (Fallback/Base)
              Container(
                color: isDark
                    ? const Color(0xFF1F1135)
                    : const Color(0xFFFAF7F2),
              ),

              // 2. SVG Background Gradient
              SvgPicture.asset(
                isDark
                    ? 'assets/dark_mode_bg.svg'
                    : 'assets/light_background.svg',
                fit: BoxFit.cover,
              ),

              // 3. Stars for dark mode
              if (isDark)
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/stars.svg',
                    fit: BoxFit.cover,
                  ),
                ),

              // 4. Background Clouds (Medium Bottom Cloud)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  isDark
                      ? 'assets/dark_mode_meduim.svg'
                      : 'assets/medium_bottom_cloud.svg',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),

              // 5. Background Clouds (Bottom Cloud)
              Positioned(
                bottom: -20, // slightly offset to overlap
                left: -20,
                right: -20,
                child: SvgPicture.asset(
                  isDark
                      ? 'assets/dark_mode_cloud.svg'
                      : 'assets/bottom_cloud.svg',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),

              // 6. Content overlay
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
