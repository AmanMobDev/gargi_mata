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
}
