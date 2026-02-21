import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/breathing_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
        if (state.phase == BreathingPhase.inhale) {
          _controller.duration = Duration(
            seconds: state.session.inhaleDuration,
          );
          _controller.forward();
        } else if (state.phase == BreathingPhase.exhale) {
          _controller.duration = Duration(
            seconds: state.session.exhaleDuration,
          );
          _controller.reverse();
        } else if (state.phase == BreathingPhase.holdIn ||
            state.phase == BreathingPhase.holdOut) {
          _controller.stop();
        } else if (state.phase == BreathingPhase.ready) {
          _controller.value = 0.5;
        }
      },
      builder: (context, state) {
        final isDark = state.isDarkMode;
        final textColor = isDark ? Colors.white : Colors.black;

        String title = '';
        if (state.phase == BreathingPhase.ready) title = 'Get ready';
        if (state.phase == BreathingPhase.inhale) title = 'Breathe in';
        if (state.phase == BreathingPhase.holdIn) title = 'Hold softly';
        if (state.phase == BreathingPhase.exhale) title = 'Breathe out';
        if (state.phase == BreathingPhase.holdOut) title = 'Hold softly';

        return Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark
                            ? const Color(0xFF630068).withOpacity(0.5)
                            : const Color(0xFFE5CCDE).withOpacity(0.8),
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  '${state.currentRound} of ${state.session.rounds}',
                  style: GoogleFonts.inter(
                    color: textColor.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${state.secondsRemaining}',
                  style: GoogleFonts.inter(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ],
        );
      },
    );
  }
}
