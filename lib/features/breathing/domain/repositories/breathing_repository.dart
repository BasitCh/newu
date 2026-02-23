import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/breathing_session.dart';

abstract class BreathingRepository {
  Future<Either<Failure, BreathingSession>> getBreathingSettings();
  Future<Either<Failure, void>> saveBreathingSettings(BreathingSession session);
}
