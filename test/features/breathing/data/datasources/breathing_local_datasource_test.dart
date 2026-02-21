import 'package:flutter_test/flutter_test.dart';
import 'package:newu/features/breathing/data/datasources/breathing_local_datasource.dart';
import 'package:newu/features/breathing/domain/entities/breathing_session.dart';

void main() {
  late BreathingLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = BreathingLocalDataSourceImpl();
  });

  group('BreathingLocalDataSourceImpl', () {
    test('getSettings should return default session initially', () async {
      final result = await dataSource.getSettings();
      expect(result, const BreathingSession());
    });

    test('saveSettings should cache the provided session', () async {
      const session = BreathingSession(
        inhaleDuration: 5,
        holdInDuration: 2,
        exhaleDuration: 5,
        holdOutDuration: 2,
      );

      await dataSource.saveSettings(session);

      final result = await dataSource.getSettings();
      expect(result, session);
    });

    test('saveSettings should override previous session', () async {
      const session1 = BreathingSession(inhaleDuration: 3);
      const session2 = BreathingSession(inhaleDuration: 8);

      await dataSource.saveSettings(session1);
      await dataSource.saveSettings(session2);

      final result = await dataSource.getSettings();
      expect(result, session2);
    });
  });
}
