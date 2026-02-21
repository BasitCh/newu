// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/breathing/data/datasources/breathing_local_datasource.dart'
    as _i508;
import 'features/breathing/data/repositories/breathing_repository_impl.dart'
    as _i533;
import 'features/breathing/domain/repositories/breathing_repository.dart'
    as _i430;
import 'features/breathing/domain/usecases/get_breathing_settings.dart'
    as _i263;
import 'features/breathing/domain/usecases/save_breathing_settings.dart'
    as _i264;
import 'features/breathing/presentation/bloc/breathing_bloc.dart' as _i638;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i508.IBreathingLocalDataSource>(
      () => _i508.BreathingLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i430.IBreathingRepository>(
      () => _i533.BreathingRepositoryImpl(
        localDataSource: gh<_i508.IBreathingLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i263.GetBreathingSettings>(
      () => _i263.GetBreathingSettings(gh<_i430.IBreathingRepository>()),
    );
    gh.lazySingleton<_i264.SaveBreathingSettings>(
      () => _i264.SaveBreathingSettings(gh<_i430.IBreathingRepository>()),
    );
    gh.factory<_i638.BreathingBloc>(
      () => _i638.BreathingBloc(
        gh<_i263.GetBreathingSettings>(),
        gh<_i264.SaveBreathingSettings>(),
      ),
    );
    return this;
  }
}
