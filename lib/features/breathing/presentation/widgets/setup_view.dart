import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/breathing_bloc.dart';
import '../bloc/breathing_event.dart';
import 'components/setup_view_components.dart';

class SetupView extends StatefulWidget {
  const SetupView({super.key});

  @override
  State<SetupView> createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView> {
  bool _isAdvancedExpanded = false;
  int _simpleDuration = 4;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BreathingBloc>().state;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor =
        theme.textTheme.bodyLarge?.color ??
        (isDark ? Colors.white : const Color(0xFF1A1A1A));
    final secondaryTextColor = isDark
        ? Colors.white70
        : const Color(0xFF8A8A8E);
    final orangeColor = const Color(0xFFFF9500);
    final darkPurple = const Color(0xFF630068);
    final headerPurple = isDark ? Colors.white : const Color(0xFF630068);
    final cardColor = isDark
        ? const Color(0xFF2C1E4A).withValues(alpha: 0.95)
        : Colors.white;
    final pillColor = isDark
        ? const Color(0xFF1A1321)
        : const Color(0xFFF2F2F7);

    final session = state.session;

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Set your breathing pace',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: headerPurple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Customise your breathing session. You\ncan always change this later.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: secondaryTextColor,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: isDark
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
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
                    SectionHeader(
                      title: 'Breath duration',
                      subtitle: 'Seconds per phase',
                      textColor: textColor,
                      secondaryColor: secondaryTextColor,
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [3, 4, 5, 10].map((dur) {
                          final isSelected = _simpleDuration == dur;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SelectorPill(
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

                    SectionHeader(
                      title: 'Rounds',
                      subtitle: isDark
                          ? 'Full box breathing cycles'
                          : 'Full breathing cycles,',
                      textColor: textColor,
                      secondaryColor: secondaryTextColor,
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            [
                              {'val': 2, 'label': '2 quick'},
                              {'val': 4, 'label': '4 calm'},
                              {'val': 6, 'label': '6 deep'},
                              {'val': 8, 'label': '8 zen'},
                            ].map((item) {
                              final val = item['val'] as int;
                              final label = item['label'] as String;
                              final isSelected = session.rounds == val;
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SelectorPill(
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
                            }).toList(),
                      ),
                    ),
                    const SizedBox(height: 32),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isAdvancedExpanded = !_isAdvancedExpanded;
                          if (!_isAdvancedExpanded) {
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
                        color: Colors.transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SectionHeader(
                                title: 'Advanced timing',
                                subtitle:
                                    'Set different durations for each phase',
                                textColor: textColor,
                                secondaryColor: secondaryTextColor,
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
                      AdjusterRow(
                        title: 'Breathe in',
                        value: session.inhaleDuration,
                        pillColor: pillColor,
                        textColor: textColor,
                        onChanged: (val) {
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
                      AdjusterRow(
                        title: 'Hold in',
                        value: session.holdInDuration,
                        pillColor: pillColor,
                        textColor: textColor,
                        onChanged: (val) {
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
                      AdjusterRow(
                        title: 'Breathe out',
                        value: session.exhaleDuration,
                        pillColor: pillColor,
                        textColor: textColor,
                        onChanged: (val) {
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
                      AdjusterRow(
                        title: 'Hold out',
                        value: session.holdOutDuration,
                        pillColor: pillColor,
                        textColor: textColor,
                        onChanged: (val) {
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SectionHeader(
                            title: 'Sound',
                            subtitle: 'Gentle chime between phases',
                            textColor: textColor,
                            secondaryColor: secondaryTextColor,
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

              const SizedBox(height: 24),
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
                      style: theme.textTheme.labelLarge?.copyWith(
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
        ),
      ),
    );
  }
}
