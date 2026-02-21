import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/breathing_session.dart';

part 'breathing_event.freezed.dart';

@freezed
abstract class BreathingEvent with _$BreathingEvent {
  const factory BreathingEvent.started() = Started;
  const factory BreathingEvent.settingsChanged(BreathingSession session) =
      SettingsChanged;
  const factory BreathingEvent.themeToggled() = ThemeToggled;
  const factory BreathingEvent.startExercise() = StartExercise;
  const factory BreathingEvent.tick() = Tick;
  const factory BreathingEvent.pause() = Pause;
  const factory BreathingEvent.resume() = Resume;
  const factory BreathingEvent.reset() = Reset;
}
