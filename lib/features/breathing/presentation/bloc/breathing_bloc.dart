import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:audioplayers/audioplayers.dart';

import 'breathing_event.dart';
import 'breathing_state.dart';
import '../../domain/usecases/get_breathing_settings.dart';
import '../../domain/usecases/save_breathing_settings.dart';
import '../../../../core/usecases/usecase.dart';

@injectable
class BreathingBloc extends Bloc<BreathingEvent, BreathingState> {
  final GetBreathingSettings getBreathingSettings;
  final SaveBreathingSettings saveBreathingSettings;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _timer;

  BreathingBloc(this.getBreathingSettings, this.saveBreathingSettings)
    : super(const BreathingState()) {
    on<Started>(_onStarted);
    on<SettingsChanged>(_onSettingsChanged);
    on<ThemeToggled>(_onThemeToggled);
    on<StartExercise>(_onStartExercise);
    on<Tick>(_onTick);
    on<Pause>(_onPause);
    on<Resume>(_onResume);
    on<Reset>(_onReset);
  }

  Future<void> _onStarted(Started event, Emitter<BreathingState> emit) async {
    final result = await getBreathingSettings(NoParams());
    result.fold(
      (failure) => emit(state),
      (session) =>
          emit(state.copyWith(session: session, phase: BreathingPhase.setup)),
    );
  }

  void _onSettingsChanged(SettingsChanged event, Emitter<BreathingState> emit) {
    emit(state.copyWith(session: event.session));
    saveBreathingSettings(SaveBreathingSettingsParams(session: event.session));
  }

  void _onThemeToggled(ThemeToggled event, Emitter<BreathingState> emit) {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }

  void _onStartExercise(StartExercise event, Emitter<BreathingState> emit) {
    emit(
      state.copyWith(
        phase: BreathingPhase.ready,
        currentRound: 1,
        secondsRemaining: 3,
      ),
    );
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(const BreathingEvent.tick());
    });
  }

  void _onTick(Tick event, Emitter<BreathingState> emit) {
    if (state.phase == BreathingPhase.setup ||
        state.phase == BreathingPhase.finished) {
      return;
    }

    int newSeconds = state.secondsRemaining - 1;

    if (newSeconds > 0) {
      emit(state.copyWith(secondsRemaining: newSeconds));
    } else {
      _advancePhase(emit);
    }
  }

  void _advancePhase(Emitter<BreathingState> emit) {
    BreathingPhase nextPhase = state.phase;
    int nextSeconds = 0;
    int currentRound = state.currentRound;

    switch (state.phase) {
      case BreathingPhase.ready:
        nextPhase = BreathingPhase.inhale;
        nextSeconds = state.session.inhaleDuration;
        break;
      case BreathingPhase.inhale:
        if (state.session.holdInDuration > 0) {
          nextPhase = BreathingPhase.holdIn;
          nextSeconds = state.session.holdInDuration;
        } else {
          nextPhase = BreathingPhase.exhale;
          nextSeconds = state.session.exhaleDuration;
        }
        break;
      case BreathingPhase.holdIn:
        nextPhase = BreathingPhase.exhale;
        nextSeconds = state.session.exhaleDuration;
        break;
      case BreathingPhase.exhale:
        if (state.session.holdOutDuration > 0) {
          nextPhase = BreathingPhase.holdOut;
          nextSeconds = state.session.holdOutDuration;
        } else {
          _checkRoundEnd(emit, currentRound);
          return;
        }
        break;
      case BreathingPhase.holdOut:
        _checkRoundEnd(emit, currentRound);
        return;
      default:
        break;
    }

    emit(state.copyWith(phase: nextPhase, secondsRemaining: nextSeconds));
  }

  void _checkRoundEnd(Emitter<BreathingState> emit, int currentRound) {
    if (currentRound >= state.session.rounds) {
      _audioPlayer.play(AssetSource('chime.wav'));
      _timer?.cancel();
      emit(state.copyWith(phase: BreathingPhase.finished));
    } else {
      _audioPlayer.play(AssetSource('chime.wav'));
      emit(
        state.copyWith(
          phase: BreathingPhase.inhale,
          secondsRemaining: state.session.inhaleDuration,
          currentRound: currentRound + 1,
        ),
      );
    }
  }

  void _onReset(Reset event, Emitter<BreathingState> emit) {
    _timer?.cancel();
    _audioPlayer.stop();
    emit(
      state.copyWith(
        phase: BreathingPhase.setup,
        currentRound: 0,
        secondsRemaining: 0,
      ),
    );
  }

  void _onPause(Pause event, Emitter<BreathingState> emit) {
    if (state.phase == BreathingPhase.setup ||
        state.phase == BreathingPhase.finished) {
      return;
    }
    _timer?.cancel();
    emit(state.copyWith(isPaused: true));
  }

  void _onResume(Resume event, Emitter<BreathingState> emit) {
    if (state.phase == BreathingPhase.setup ||
        state.phase == BreathingPhase.finished) {
      return;
    }
    emit(state.copyWith(isPaused: false));
    _startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
