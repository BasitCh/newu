import 'package:injectable/injectable.dart';
import '../../domain/entities/breathing_session.dart';

abstract class IBreathingLocalDataSource {
  Future<BreathingSession> getSettings();
  Future<void> saveSettings(BreathingSession session);
}

@LazySingleton(as: IBreathingLocalDataSource)
class BreathingLocalDataSourceImpl implements IBreathingLocalDataSource {
  BreathingSession _cachedSession = const BreathingSession();

  @override
  Future<BreathingSession> getSettings() async {
    return Future.value(_cachedSession);
  }

  @override
  Future<void> saveSettings(BreathingSession session) async {
    _cachedSession = session;
    return Future.value();
  }
}
