import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      child: const _BreathingView(),
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
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                      : null,
                ),
              ),

              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    key: ValueKey<bool>(isDark),
                    fit: StackFit.expand,
                    children: [
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
                              'assets/dark_cloud_1.svg',
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
                              'assets/dark_cloud_2.svg',
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
                          child: SvgPicture.asset(
                            'assets/cloud_1.svg',
                            width: 140,
                          ),
                        ),
                        Positioned(
                          top: 170,
                          left: -20,
                          child: SvgPicture.asset(
                            'assets/cloud_2.svg',
                            width: 130,
                          ),
                        ),
                        Positioned(
                          top: 550,
                          left: -20,
                          child: SvgPicture.asset(
                            'assets/small_cloud.svg',
                            width: 90,
                          ),
                        ),
                        Positioned(
                          top: 250,
                          right: -20,
                          child: SvgPicture.asset(
                            'assets/cloud_3.svg',
                            width: 120,
                          ),
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
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 72.0),
                      child: _buildContent(state),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: IgnorePointer(
                    ignoring: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (state.phase != BreathingPhase.setup)
                            GestureDetector(
                              onTap: () {
                                context.read<BreathingBloc>().add(
                                  const BreathingEvent.reset(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.close,
                                  color: isDark
                                      ? Colors.white70
                                      : const Color(0xFF8A8A8E),
                                  size: 28,
                                ),
                              ),
                            )
                          else
                            const SizedBox(width: 44),
                          GestureDetector(
                            onTap: () {
                              context.read<BreathingBloc>().add(
                                const BreathingEvent.themeToggled(),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                isDark
                                    ? Icons.light_mode_outlined
                                    : Icons.dark_mode_outlined,
                                color: isDark
                                    ? Colors.white
                                    : const Color(0xFF8A8A8E),
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
