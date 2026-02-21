import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/breathing_session.dart';

part 'breathing_state.freezed.dart';

enum BreathingPhase { setup, ready, inhale, holdIn, exhale, holdOut, finished }

@freezed
class BreathingState with _$BreathingState {
  const factory BreathingState({
    @Default(BreathingPhase.setup) BreathingPhase phase,
    @Default(BreathingSession()) BreathingSession session,
    @Default(0) int currentRound,
    @Default(0) int secondsRemaining,
    @Default(false) bool isDarkMode,
  }) = _BreathingState;
}
