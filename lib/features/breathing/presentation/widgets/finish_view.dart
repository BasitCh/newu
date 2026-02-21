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
    final textColor = isDark ? Colors.white : Colors.black;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 64),
          ),
          const SizedBox(height: 24),
          Text(
            'You did it!',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'We hope you enjoyed \nthe breathing session.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: textColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 64),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF630068),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
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
              'Start again',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              context.read<BreathingBloc>().add(const BreathingEvent.reset());
            },
            child: Text(
              'Back to set up',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF630068),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
