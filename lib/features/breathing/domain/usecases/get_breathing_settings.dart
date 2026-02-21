import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/breathing_session.dart';
import '../repositories/breathing_repository.dart';

@lazySingleton
class GetBreathingSettings implements UseCase<BreathingSession, NoParams> {
  final IBreathingRepository repository;

  GetBreathingSettings(this.repository);

  @override
  Future<Either<Failure, BreathingSession>> call(NoParams params) async {
    return await repository.getBreathingSettings();
  }
}
