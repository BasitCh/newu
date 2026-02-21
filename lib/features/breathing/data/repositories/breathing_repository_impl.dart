import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/breathing_session.dart';
import '../../domain/repositories/breathing_repository.dart';
import '../datasources/breathing_local_datasource.dart';

@LazySingleton(as: IBreathingRepository)
class BreathingRepositoryImpl implements IBreathingRepository {
  final IBreathingLocalDataSource localDataSource;

  BreathingRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, BreathingSession>> getBreathingSettings() async {
    try {
      final session = await localDataSource.getSettings();
      return Right(session);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveBreathingSettings(
    BreathingSession session,
  ) async {
    try {
      await localDataSource.saveSettings(session);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
