import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/breathing_bloc.dart';
import '../bloc/breathing_event.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BreathingBloc>().state;
    final isDark = state.isDarkMode;
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A1A);
    final secondaryTextColor = isDark
        ? Colors.white70
        : const Color(0xFF666666);
    final session = state.session;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Set your pac', // From figma image 'Set your breathing pace' but we'll use 'pace'
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<BreathingBloc>().add(
                    const BreathingEvent.themeToggled(),
                  );
                },
                child: SvgPicture.asset(
                  isDark
                      ? 'assets/dark_mode_icon.svg'
                      : 'assets/dark_mode_icon.svg', // Assuming same icon or change if needed
                  width: 32,
                  height: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Customize your breathing session here. You can always change this later.',
            style: GoogleFonts.inter(fontSize: 14, color: secondaryTextColor),
          ),
          const SizedBox(height: 48),

          _buildSelectorRow(
            title: 'Breath duration',
            subtitle: 'Seconds per phase',
            options: const [3, 4, 5],
            labels: const ['3s', '4s', '5s'],
            selectedValue: session.inhaleDuration,
            onChanged: (val) {
              context.read<BreathingBloc>().add(
                BreathingEvent.settingsChanged(
                  session.copyWith(inhaleDuration: val, exhaleDuration: val),
                ),
              );
            },
            isDark: isDark,
          ),

          const SizedBox(height: 32),

          _buildSelectorRow(
            title: 'Rounds',
            subtitle: 'Breathing cycles',
            options: const [2, 3, 4],
            labels: const ['2', '3', '4'],
            selectedValue: session.rounds,
            onChanged: (val) {
              context.read<BreathingBloc>().add(
                BreathingEvent.settingsChanged(session.copyWith(rounds: val)),
              );
            },
            isDark: isDark,
          ),

          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Advanced timing',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Set different durations for each phase',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
              CupertinoSwitch(
                value:
                    session.holdInDuration >
                    0, // Simplified trigger for advanced timing
                activeColor: const Color(0xFF630068),
                onChanged: (val) {
                  context.read<BreathingBloc>().add(
                    BreathingEvent.settingsChanged(
                      session.copyWith(
                        holdInDuration: val ? 2 : 0,
                        holdOutDuration: val ? 2 : 0,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sound',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Chime between phases',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
              CupertinoSwitch(
                value: session.soundEnabled,
                activeColor: const Color(0xFF630068),
                onChanged: (val) {
                  context.read<BreathingBloc>().add(
                    BreathingEvent.settingsChanged(
                      session.copyWith(soundEnabled: val),
                    ),
                  );
                },
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

  Widget _buildSelectorRow({
    required String title,
    required String subtitle,
    required List<int> options,
    required List<String> labels,
    required int selectedValue,
    required Function(int) onChanged,
    required bool isDark,
  }) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A1A);
    final secondaryTextColor = isDark
        ? Colors.white70
        : const Color(0xFF666666);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.inter(fontSize: 12, color: secondaryTextColor),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2C1E4A) : const Color(0xFFF0E5EC),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: List.generate(options.length, (index) {
              final isSelected = options[index] == selectedValue;
              return GestureDetector(
                onTap: () => onChanged(options[index]),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF630068)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    labels[index],
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : (isDark ? Colors.white54 : const Color(0xFF666666)),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
