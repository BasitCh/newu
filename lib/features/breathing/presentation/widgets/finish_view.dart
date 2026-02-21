import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/breathing_bloc.dart';
import '../bloc/breathing_event.dart';

class FinishView extends StatelessWidget {
  const FinishView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<BreathingBloc>().state.isDarkMode;
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A1A);
    final secondaryTextColor = isDark
        ? Colors.white70
        : const Color(0xFF666666);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF5DBB63).withOpacity(0.2)
                      : const Color(0xFFE2F0E5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: isDark
                      ? const Color(0xFF5DBB63)
                      : const Color(0xFF458B4A),
                  size: 64,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'You did it!',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'We hope you enjoyed \nthe breathing session.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  height: 1.4,
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF630068),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: () {
              context.read<BreathingBloc>().add(
                const BreathingEvent.startExercise(),
              );
            },
            child: Text(
              'Start again',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            onPressed: () {
              context.read<BreathingBloc>().add(const BreathingEvent.reset());
            },
            child: Text(
              'Back to set up',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: isDark
                    ? const Color(0xFFD699DC)
                    : const Color(0xFF630068),
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
