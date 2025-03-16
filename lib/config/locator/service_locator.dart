import 'package:gargi_mata/features/bhajan/data/data_source/bhajan_data_source_imp.dart';
import 'package:gargi_mata/features/bhajan/data/repository/bhajan_data_repository.dart';
import 'package:gargi_mata/features/bhajan/domain/usecase/bhajan_use_case.dart';
import 'package:gargi_mata/features/daan/data/data_source/daan_data_source_imp.dart';
import 'package:gargi_mata/features/daan/data/repository/daan_data_repository.dart';
import 'package:gargi_mata/features/daan/presentation/bloc/daan_bloc.dart';
import 'package:gargi_mata/features/gallery/data/data_source/data_source_imp.dart';
import 'package:gargi_mata/features/gallery/domain/usecase/gallery_use_case.dart';
import 'package:gargi_mata/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:gargi_mata/features/history/data/repository/history_data_repository.dart';
import 'package:gargi_mata/features/history/domain/usecase/history_use_case.dart';
import 'package:gargi_mata/features/history/presentation/bloc/history_bloc.dart';
import 'package:gargi_mata/features/home/data/data_source/home_data_source_imp.dart';
import 'package:gargi_mata/features/home/data/repository/home_data_repository.dart';
import 'package:gargi_mata/features/mantra/data/data_source/mantra_data_source_imp.dart';
import 'package:gargi_mata/features/mantra/data/repository/mantra_data_repository.dart';
import 'package:gargi_mata/features/mantra/domain/usecase/mantra_use_case.dart';
import 'package:gargi_mata/features/mantra/presentation/bloc/mantra_bloc.dart';
import 'package:gargi_mata/features/samagri/presentation/bloc/samagri_bloc.dart';
import 'package:gargi_mata/features/vidhi/data/repository/vidhi_data_repository.dart';
import 'package:gargi_mata/features/vidhi/domain/usecase/vidhi_use_case.dart';
import 'package:gargi_mata/features/vidhi/presentation/bloc/vidhi_bloc.dart';

import '../../features/bhajan/presentation/bloc/bhajan_bloc.dart';
import '../../features/gallery/data/repository/gallery_data_repository.dart';
import '../../features/history/data/data_source/history_data_source_imp.dart';
import '../../features/samagri/data/data_source/samagri_data_source_imp.dart';
import '../../features/samagri/data/repository/samagri_data_repository.dart';
import '../../features/samagri/domain/usecase/samagri_use_case.dart';
import '../../features/vidhi/data/data_source/vidhi_data_source_imp.dart';
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

  /// Register Daan Data
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

  /// Register Samagri Data
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

  /// Register Home Data
  locator.registerSingleton<HomeDataSourceImp>(
    HomeDataSourceImp(services: locator<DataBaseCollectionServices>()),
  );

  locator.registerSingleton<HomeDataRepository>(
    HomeDataRepository(homeDataSource: locator<HomeDataSourceImp>()),
  );

  locator.registerSingleton<HomeUseCase>(
    HomeUseCase(homeDataRepository: locator<HomeDataRepository>()),
  );

  locator.registerFactory<HomeBloc>(
    () => HomeBloc(homeUseCase: locator<HomeUseCase>()),
  );

  /// Register Gallery Data

  locator.registerSingleton<GalleryDataSourceImp>(
    GalleryDataSourceImp(
      dataBaseCollectionServices: locator<DataBaseCollectionServices>(),
    ),
  );

  locator.registerSingleton<GalleryDataRepository>(
    GalleryDataRepository(galleryDataSource: locator<GalleryDataSourceImp>()),
  );

  locator.registerSingleton<GetGalleryUseCase>(
    GetGalleryUseCase(galleryDataRepository: locator<GalleryDataRepository>()),
  );

  locator.registerFactory<GalleryBloc>(
    () => GalleryBloc(getGalleryUseCase: locator<GetGalleryUseCase>()),
  );

  /// Register Bhajan Data

  locator.registerSingleton<BhajanDataSourceImp>(
    BhajanDataSourceImp(
      dataBaseCollectionServices: locator<DataBaseCollectionServices>(),
    ),
  );

  locator.registerSingleton<BhajanDataRepository>(
    BhajanDataRepository(bhajanDataSourceImp: locator<BhajanDataSourceImp>()),
  );

  locator.registerSingleton<GetBhajanUseCase>(
    GetBhajanUseCase(bhajanDataRepository: locator<BhajanDataRepository>()),
  );

  locator.registerFactory<BhajanBloc>(
    () => BhajanBloc(fetchAudioListUseCase: locator<GetBhajanUseCase>()),
  );

  /// Register Mantra Data

  locator.registerSingleton<MantraDataSourceImp>(
    MantraDataSourceImp(
      dataBaseCollectionServices: locator<DataBaseCollectionServices>(),
    ),
  );

  locator.registerSingleton<MantraDataRepository>(
    MantraDataRepository(mantraDataSource: locator<MantraDataSourceImp>()),
  );

  locator.registerSingleton<GetMantraUseCase>(
    GetMantraUseCase(mantraDataRepository: locator<MantraDataRepository>()),
  );

  locator.registerFactory<MantraBloc>(
    () => MantraBloc(getMantraUseCase: locator<GetMantraUseCase>()),
  );

  /// Register Vidhi Data

  locator.registerSingleton<VidhiDataSourceImp>(
    VidhiDataSourceImp(dbService: locator<DataBaseCollectionServices>()),
  );

  locator.registerSingleton<VidhiDataRepository>(
    VidhiDataRepository(vidhiDataSourceImp: locator<VidhiDataSourceImp>()),
  );

  locator.registerSingleton<GetVidhiUseCase>(
    GetVidhiUseCase(vidhiDataRepository: locator<VidhiDataRepository>()),
  );

  locator.registerFactory<VidhiBloc>(
    () => VidhiBloc(getVidhiUseCase: locator<GetVidhiUseCase>()),
  );

  /// Register History Data

  locator.registerSingleton<HistoryDataSourceImp>(
    HistoryDataSourceImp(
      dataBaseCollectionServices: locator<DataBaseCollectionServices>(),
    ),
  );

  locator.registerSingleton<HistoryDataRepository>(
    HistoryDataRepository(historyDataSource: locator<HistoryDataSourceImp>()),
  );

  locator.registerSingleton<GetHistoryUseCase>(
    GetHistoryUseCase(historyDataRepository: locator<HistoryDataRepository>()),
  );

  locator.registerFactory<HistoryBloc>(
    () => HistoryBloc(getHistoryDataUseCase: locator<GetHistoryUseCase>()),
  );
}
