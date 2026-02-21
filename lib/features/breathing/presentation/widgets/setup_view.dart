import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/breathing_bloc.dart';
import '../bloc/breathing_event.dart';

class SetupView extends StatefulWidget {
  const SetupView({super.key});

  @override
  State<SetupView> createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView> {
  bool _isAdvancedExpanded = false;
  int _simpleDuration = 4; // Default as per requirements

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BreathingBloc>().state;
    final isDark = state.isDarkMode;

    // Theme colors matching Figma
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A1A);
    final secondaryTextColor = isDark
        ? Colors.white70
        : const Color(0xFF8A8A8E);
    final orangeColor = const Color(0xFFFF9500);
    final darkPurple = const Color(0xFF630068);
    final headerPurple = isDark ? Colors.white : const Color(0xFF630068);
    final cardColor = isDark
        ? const Color(0xFF2C1E4A).withOpacity(0.95)
        : Colors.white;
    final pillColor = isDark
        ? const Color(0xFF3D2B59)
        : const Color(0xFFF2F2F7);

    final session = state.session;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Nav / Theme Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                        ? CupertinoIcons.sun_max_fill
                        : CupertinoIcons.moon_fill,
                    color: isDark ? Colors.amber : const Color(0xFF8A8A8E),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Headers
          Text(
            isDark ? 'Set your pace' : 'Set your breathing pace',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: headerPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Customise your breathing session. You\ncan always change this later.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: secondaryTextColor,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),

          // Central Card settings
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: isDark
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                  border: isDark
                      ? null
                      : Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- BREATH DURATION ---
                    _buildSectionHeader(
                      'Breath duration',
                      'Seconds per phase',
                      textColor,
                      secondaryTextColor,
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [3, 4, 5, 10].map((dur) {
                          final isSelected = _simpleDuration == dur;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: _buildSelectorPill(
                              label: '${dur}s',
                              isSelected: isSelected,
                              orangeColor: orangeColor,
                              pillColor: pillColor,
                              isDark: isDark,
                              onTap: () {
                                setState(() => _simpleDuration = dur);
                                if (!_isAdvancedExpanded) {
                                  context.read<BreathingBloc>().add(
                                    BreathingEvent.settingsChanged(
                                      session.copyWith(
                                        inhaleDuration: dur,
                                        exhaleDuration: dur,
                                        holdInDuration: 0,
                                        holdOutDuration: 0,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // --- ROUNDS ---
                    _buildSectionHeader(
                      'Rounds',
                      isDark
                          ? 'Full box breathing cycles'
                          : 'Full breathing cycles,',
                      textColor,
                      secondaryTextColor,
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            (isDark
                                    ? [
                                        {'val': 2, 'label': '2 quick'},
                                        {'val': 4, 'label': '4 calm'},
                                        {'val': 6, 'label': '6 deep'},
                                        {'val': 8, 'label': '8 zen'},
                                      ]
                                    : [
                                        {'val': 2, 'label': '2 min'},
                                        {'val': 4, 'label': '4 min'},
                                        {'val': 6, 'label': '6 min'},
                                        {'val': 8, 'label': '8 min'},
                                      ])
                                .map((item) {
                                  final val = item['val'] as int;
                                  final label = item['label'] as String;
                                  final isSelected = session.rounds == val;
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: _buildSelectorPill(
                                      label: label,
                                      isSelected: isSelected,
                                      orangeColor: orangeColor,
                                      pillColor: pillColor,
                                      isDark: isDark,
                                      onTap: () {
                                        context.read<BreathingBloc>().add(
                                          BreathingEvent.settingsChanged(
                                            session.copyWith(rounds: val),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                })
                                .toList(),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // --- ADVANCED TIMING ---
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isAdvancedExpanded = !_isAdvancedExpanded;
                          if (!_isAdvancedExpanded) {
                            // Reset values to simple duration on collapse
                            context.read<BreathingBloc>().add(
                              BreathingEvent.settingsChanged(
                                session.copyWith(
                                  inhaleDuration: _simpleDuration,
                                  exhaleDuration: _simpleDuration,
                                  holdInDuration: 0,
                                  holdOutDuration: 0,
                                ),
                              ),
                            );
                          }
                        });
                      },
                      child: Container(
                        color:
                            Colors.transparent, // Ensure full area is tappable
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildSectionHeader(
                                'Advanced timing',
                                'Set different durations for each phase',
                                textColor,
                                secondaryTextColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                _isAdvancedExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_isAdvancedExpanded) ...[
                      const SizedBox(height: 24),
                      _buildAdjusterRow(
                        'Breathe in',
                        session.inhaleDuration,
                        pillColor,
                        textColor,
                        (val) {
                          if (val > 0) {
                            context.read<BreathingBloc>().add(
                              BreathingEvent.settingsChanged(
                                session.copyWith(inhaleDuration: val),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      _buildAdjusterRow(
                        'Hold in',
                        session.holdInDuration,
                        pillColor,
                        textColor,
                        (val) {
                          if (val >= 0) {
                            context.read<BreathingBloc>().add(
                              BreathingEvent.settingsChanged(
                                session.copyWith(holdInDuration: val),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      _buildAdjusterRow(
                        'Breathe out',
                        session.exhaleDuration,
                        pillColor,
                        textColor,
                        (val) {
                          if (val > 0) {
                            context.read<BreathingBloc>().add(
                              BreathingEvent.settingsChanged(
                                session.copyWith(exhaleDuration: val),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      _buildAdjusterRow(
                        'Hold out',
                        session.holdOutDuration,
                        pillColor,
                        textColor,
                        (val) {
                          if (val >= 0) {
                            context.read<BreathingBloc>().add(
                              BreathingEvent.settingsChanged(
                                session.copyWith(holdOutDuration: val),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                    const SizedBox(height: 32),

                    // --- SOUND ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _buildSectionHeader(
                            'Sound',
                            'Gentle chime between phases',
                            textColor,
                            secondaryTextColor,
                          ),
                        ),
                        CupertinoSwitch(
                          value: session.soundEnabled,
                          activeTrackColor: darkPurple,
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
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Start Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkPurple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              elevation: 0,
            ),
            onPressed: () {
              context.read<BreathingBloc>().add(
                const BreathingEvent.startExercise(),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Start breathing',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.air, size: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title,
    String subtitle,
    Color textColor,
    Color secondaryColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
          style: GoogleFonts.inter(fontSize: 13, color: secondaryColor),
        ),
      ],
    );
  }

  Widget _buildSelectorPill({
    required String label,
    required bool isSelected,
    required Color orangeColor,
    required Color pillColor,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : pillColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? orangeColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: isSelected
                ? orangeColor
                : (isDark ? Colors.white70 : const Color(0xFF8A8A8E)),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildAdjusterRow(
    String title,
    int value,
    Color pillColor,
    Color textColor,
    Function(int) onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: pillColor,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => onChanged(value - 1),
                child: Icon(Icons.remove, size: 20, color: textColor),
              ),
              const SizedBox(width: 24),
              Text(
                '${value}s',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: () => onChanged(value + 1),
                child: Icon(Icons.add, size: 20, color: textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
