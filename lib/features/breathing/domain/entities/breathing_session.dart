import 'package:freezed_annotation/freezed_annotation.dart';

part 'breathing_session.freezed.dart';

@freezed
abstract class BreathingSession with _$BreathingSession {
  const factory BreathingSession({
    @Default(4) int inhaleDuration,
    @Default(0) int holdInDuration,
    @Default(4) int exhaleDuration,
    @Default(0) int holdOutDuration,
    @Default(4) int rounds,
    @Default(false) bool soundEnabled,
  }) = _BreathingSession;
}
