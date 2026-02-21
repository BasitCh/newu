import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/breathing_bloc.dart';
import '../bloc/breathing_event.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BreathingBloc>().state;
    final isDark = state.isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Set your breathing pace',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              IconButton(
                icon: Icon(
                  isDark ? Icons.light_mode : Icons.dark_mode,
                  color: textColor,
                ),
                onPressed: () {
                  context.read<BreathingBloc>().add(
                    const BreathingEvent.themeToggled(),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Customize your breathing session here. You can always change this later.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: textColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 32),
          // TODO: Add detailed controls for inhale, hold, exhale duration
          // For now, simplify and just show a start button
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF630068),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              context.read<BreathingBloc>().add(
                const BreathingEvent.startExercise(),
              );
            },
            child: Text(
              'Start breathing',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
