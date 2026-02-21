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
              Container(
                decoration: BoxDecoration(
                  color: isDark ? null : Colors.white,
                  gradient: isDark
                      ? const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4, 1.0],
                          colors: [
                            Color(0xFF1A1128),
                            Color(0xFF2D1B4E),
                            Color(0xFF3A2260),
                          ],
                        )
                      : LinearGradient(
                          transform: const GradientRotation(
                            74.192 * 3.1415926535 / 180,
                          ),
                          colors: [
                            const Color(0xFF630068).withValues(alpha: 0.08),
                            const Color(0xFFFF8A00).withValues(alpha: 0.08),
                          ],
                        ),
                ),
              ),

              if (isDark)
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/stars.svg',
                    fit: BoxFit.cover,
                  ),
                ),

              if (isDark) ...[
                Positioned(
                  top: -10,
                  left: -20,
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      'assets/dark_small_cloud_1.svg',
                      width: 160,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  right: -10,
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      'assets/dark_small_cloud_2.svg',
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: 450,
                  left: -30,
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      'assets/dark_ cloud_1.svg',
                      width: 140,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 200,
                  right: -20,
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      'assets/dark_ cloud_2.svg',
                      width: 120,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  left: -20,
                  right: -20,
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      'assets/dark_mode_cloud.svg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ] else ...[
                Positioned(
                  top: 30,
                  right: -70,
                  child: SvgPicture.asset(
                    'assets/big_cloud.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 150,
                  right: -40,
                  child: SvgPicture.asset('assets/cloud _1.svg', width: 140),
                ),
                Positioned(
                  top: 170,
                  left: -20,
                  child: SvgPicture.asset('assets/cloud _2.svg', width: 130),
                ),
                Positioned(
                  top: 550,
                  left: -20,
                  child: SvgPicture.asset('assets/small_cloud.svg', width: 90),
                ),
                Positioned(
                  top: 250,
                  right: -20,
                  child: SvgPicture.asset('assets/cloud _3.svg', width: 120),
                ),
                Positioned(
                  bottom: 60,
                  right: -20,
                  left: 60,
                  child: SvgPicture.asset(
                    'assets/medium_bottom_cloud.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  bottom: -20,
                  left: -20,
                  right: -20,
                  child: SvgPicture.asset(
                    'assets/bottom_cloud.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],

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
