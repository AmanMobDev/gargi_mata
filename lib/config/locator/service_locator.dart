import 'package:gargi_mata/features/daan/data/data_source/daan_data_source_imp.dart';
import 'package:gargi_mata/features/daan/data/repository/daan_data_repository.dart';
import 'package:gargi_mata/features/daan/presentation/bloc/daan_bloc.dart';
import 'package:gargi_mata/features/samagri/presentation/bloc/samagri_bloc.dart';

import '../../features/samagri/data/data_source/samagri_data_source_imp.dart';
import '../../features/samagri/data/repository/samagri_data_repository.dart';
import '../../features/samagri/domain/usecase/samagri_use_case.dart';
import '../exports/app_export.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register AppServices
  locator.registerSingleton<DataBaseCollectionServices>(
    DataBaseCollectionServices(),
  );

  // Register JoinDataSource
  locator.registerSingleton<JoinDataSourceImp>(
    JoinDataSourceImp(services: locator<DataBaseCollectionServices>()),
  );

  // Register JoinRepository
  locator.registerSingleton<JoinDataRepository>(
    JoinDataRepository(joinDataSource: locator<JoinDataSourceImp>()),
  );

  // Register JoinDataUseCase
  locator.registerSingleton<GetJoinDataUseCase>(
    GetJoinDataUseCase(repository: locator<JoinDataRepository>()),
  );

  // Register JoinBloc
  locator.registerFactory<JoinBloc>(
    () => JoinBloc(getJoinDataUseCase: locator<GetJoinDataUseCase>()),
  );

  locator.registerSingleton<DaanDataSourceImp>(
    DaanDataSourceImp(
      dataBaseCollectionServices: locator<DataBaseCollectionServices>(),
    ),
  );

  locator.registerSingleton<DaanDataRepository>(
    DaanDataRepository(daanDataSource: locator<DaanDataSourceImp>()),
  );

  locator.registerSingleton<DaanUseCase>(
    DaanUseCase(daanDataRepository: locator<DaanDataRepository>()),
  );

  locator.registerFactory<DaanBloc>(
    () => DaanBloc(daanDataUseCase: locator<DaanUseCase>()),
  );

  locator.registerSingleton<SamagriDataSourceImp>(
    SamagriDataSourceImp(
      dataBaseCollectionServices: locator<DataBaseCollectionServices>(),
    ),
  );

  locator.registerSingleton<SamagriDataRepository>(
    SamagriDataRepository(samagriDataSource: locator<SamagriDataSourceImp>()),
  );

  locator.registerSingleton<SamagriUseCase>(
    SamagriUseCase(samagriDataRepository: locator<SamagriDataRepository>()),
  );

  locator.registerFactory<SamagriBloc>(
    () => SamagriBloc(samagriUseCase: locator<SamagriUseCase>()),
  );
}
