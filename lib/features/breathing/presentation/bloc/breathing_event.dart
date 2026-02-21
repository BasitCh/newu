import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/breathing_session.dart';

part 'breathing_event.freezed.dart';

@freezed
class BreathingEvent with _$BreathingEvent {
  const factory BreathingEvent.started() = _Started;
  const factory BreathingEvent.settingsChanged(BreathingSession session) =
      _SettingsChanged;
  const factory BreathingEvent.themeToggled() = _ThemeToggled;
  const factory BreathingEvent.startExercise() = _StartExercise;
  const factory BreathingEvent.tick() = _Tick;
  const factory BreathingEvent.reset() = _Reset;
}
