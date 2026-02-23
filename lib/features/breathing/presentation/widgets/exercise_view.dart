import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/breathing_bloc.dart';
import '../bloc/breathing_event.dart';
import '../bloc/breathing_state.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({super.key});

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  BreathingPhase? _previousPhase;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreathingBloc, BreathingState>(
      listener: (context, state) {
        if (state.isPaused) {
          _controller.stop();
          return;
        }

        bool phaseChanged = _previousPhase != state.phase;
        _previousPhase = state.phase;

        if (state.phase == BreathingPhase.inhale) {
          _controller.duration = Duration(
            seconds: state.session.inhaleDuration,
          );
          if (phaseChanged) {
            _controller.forward(from: 0.0);
          } else if (!_controller.isAnimating) {
            _controller.forward();
          }
        } else if (state.phase == BreathingPhase.exhale) {
          _controller.duration = Duration(
            seconds: state.session.exhaleDuration,
          );
          if (phaseChanged) {
            _controller.reverse(from: 1.0);
          } else if (!_controller.isAnimating) {
            _controller.reverse();
          }
        } else if (state.phase == BreathingPhase.holdIn) {
          if (phaseChanged) _controller.value = 1.0;
          _controller.stop();
        } else if (state.phase == BreathingPhase.holdOut) {
          if (phaseChanged) _controller.value = 0.0;
          _controller.stop();
        } else if (state.phase == BreathingPhase.ready) {
          if (phaseChanged) _controller.value = 0.5;
        } else if (state.phase == BreathingPhase.setup) {
          if (phaseChanged) _controller.reset();
        }
      },
      builder: (context, state) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;
        final textColor = isDark ? Colors.white : const Color(0xFF1A1A1A);
        final subtitleColor = isDark ? Colors.white70 : const Color(0xFF8A8A8E);
        String title = '';
        String subtitle = '';
        String bubbleText = '';

        switch (state.phase) {
          case BreathingPhase.ready:
            title = 'Get ready';
            subtitle = 'Get going on your breathing session';
            bubbleText = state.secondsRemaining.toString();
            break;
          case BreathingPhase.inhale:
            title = 'Breathe in';
            subtitle = 'nice and slow';
            int countUp =
                state.session.inhaleDuration - state.secondsRemaining + 1;
            if (countUp > state.session.inhaleDuration) {
              countUp = state.session.inhaleDuration;
            }
            if (countUp < 1) countUp = 1;
            bubbleText = countUp.toString();
            break;
          case BreathingPhase.holdIn:
          case BreathingPhase.holdOut:
            title = state.phase == BreathingPhase.holdIn
                ? 'Hold gently'
                : 'Hold softly';
            subtitle = 'just be here';
            bubbleText = '';
            break;
          case BreathingPhase.exhale:
            title = 'Breathe out';
            subtitle = 'nice and slow';
            bubbleText = state.secondsRemaining.toString();
            break;
          default:
            break;
        }

        double progress = 0.0;
        int totalRoundDuration =
            state.session.inhaleDuration +
            state.session.holdInDuration +
            state.session.exhaleDuration +
            state.session.holdOutDuration;
        if (totalRoundDuration > 0 && state.session.rounds > 0) {
          int elapsedInRound = 0;
          if (state.phase == BreathingPhase.inhale) {
            elapsedInRound =
                state.session.inhaleDuration - state.secondsRemaining;
          } else if (state.phase == BreathingPhase.holdIn) {
            elapsedInRound =
                state.session.inhaleDuration +
                (state.session.holdInDuration - state.secondsRemaining);
          } else if (state.phase == BreathingPhase.exhale) {
            elapsedInRound =
                state.session.inhaleDuration +
                state.session.holdInDuration +
                (state.session.exhaleDuration - state.secondsRemaining);
          } else if (state.phase == BreathingPhase.holdOut) {
            elapsedInRound =
                state.session.inhaleDuration +
                state.session.holdInDuration +
                state.session.exhaleDuration +
                (state.session.holdOutDuration - state.secondsRemaining);
          }

          double totalElapsed =
              (((state.currentRound - 1) * totalRoundDuration) + elapsedInRound)
                  .toDouble();
          progress = totalElapsed / (totalRoundDuration * state.session.rounds);
          if (progress < 0) progress = 0;
          if (progress > 1) progress = 1;

          if (state.phase == BreathingPhase.ready) progress = 0.0;
        }

        final bubbleColor = isDark
            ? const Color(0xFF4C3073)
            : const Color(0xFFE7D5E4);

        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Text(
                  "You're a natural",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: subtitleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 48),

                SizedBox(
                  height: 280,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _scaleAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            width: 240,
                            height: 240,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: bubbleColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              bubbleText,
                              style: GoogleFonts.inter(
                                fontSize: 72,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: subtitleColor,
                  ),
                ),

                const SizedBox(height: 48),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Column(
                    children: [
                      TweenAnimationBuilder<double>(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear,
                        tween: Tween<double>(begin: progress, end: progress),
                        builder: (context, value, _) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              final width = constraints.maxWidth;
                              final thumbRadius = 4.0;
                              final trackHeight = 3.0;
                              final activeWidth = width * value;

                              return SizedBox(
                                height: 12,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      width: width,
                                      height: trackHeight,
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? const Color(0xFF23143B)
                                            : const Color(0xFFF2F2F7),
                                        borderRadius: BorderRadius.circular(
                                          trackHeight / 2,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: activeWidth,
                                      height: trackHeight,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD64D3A),
                                        borderRadius: BorderRadius.circular(
                                          trackHeight / 2,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: activeWidth - thumbRadius < 0
                                          ? 0
                                          : activeWidth - thumbRadius,
                                      child: Container(
                                        width: thumbRadius * 2,
                                        height: thumbRadius * 2,
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? const Color(0xFFF96451)
                                              : const Color(0xFFD64D3A),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Cycle ${state.currentRound > 0 ? state.currentRound : 1} of ${state.session.rounds}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: subtitleColor,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                GestureDetector(
                  onTap: () {
                    if (state.isPaused) {
                      context.read<BreathingBloc>().add(
                        const BreathingEvent.resume(),
                      );
                    } else {
                      context.read<BreathingBloc>().add(
                        const BreathingEvent.pause(),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF4C3073)
                          : const Color(0xFFE7D5E4),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          state.isPaused
                              ? CupertinoIcons.play_arrow_solid
                              : CupertinoIcons.pause_solid,
                          color: textColor,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.isPaused ? 'Resume' : 'Pause',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}
