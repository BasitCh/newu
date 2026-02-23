import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/breathing_session.dart';
import '../repositories/breathing_repository.dart';

@lazySingleton
class SaveBreathingSettings
    implements UseCase<void, SaveBreathingSettingsParams> {
  final BreathingRepository repository;

  SaveBreathingSettings(this.repository);

  @override
  Future<Either<Failure, void>> call(SaveBreathingSettingsParams params) async {
    return await repository.saveBreathingSettings(params.session);
  }
}

class SaveBreathingSettingsParams extends Equatable {
  final BreathingSession session;

  const SaveBreathingSettingsParams({required this.session});

  @override
  List<Object> get props => [session];
}
