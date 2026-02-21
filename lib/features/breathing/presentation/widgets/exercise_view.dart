import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    // The bubble in Figma scales from small to large (1.0).
    _scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
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
        } else if (state.phase == BreathingPhase.setup) {
          _controller.reset();
        }
      },
      builder: (context, state) {
        final isDark = state.isDarkMode;
        final textColor = isDark ? Colors.white : const Color(0xFF1A1A1A);

        String title = '';
        if (state.phase == BreathingPhase.ready) title = 'Get ready';
        if (state.phase == BreathingPhase.inhale) title = 'Breathe in';
        if (state.phase == BreathingPhase.holdIn) title = 'Hold softly';
        if (state.phase == BreathingPhase.exhale) title = 'Breathe out';
        if (state.phase == BreathingPhase.holdOut) title = 'Hold softly';

        return Column(
          children: [
            const SizedBox(height: 24),
            Text(
              '${state.currentRound} of ${state.session.rounds}',
              style: GoogleFonts.inter(
                color: isDark ? Colors.white54 : const Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: SvgPicture.asset(
                          'assets/big_cloud.svg', // Will color this below or just use as is
                          width: 280,
                          height: 280,
                          colorFilter: isDark
                              ? const ColorFilter.mode(
                                  Color(0xFF332056),
                                  BlendMode.srcIn,
                                )
                              : const ColorFilter.mode(
                                  Color(0xFFE5CCDE),
                                  BlendMode.srcIn,
                                ),
                        ),
                      );
                    },
                  ),
                  Text(
                    '${state.secondsRemaining}',
                    style: GoogleFonts.inter(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : const Color(0xFF630068),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        );
      },
    );
  }
}
